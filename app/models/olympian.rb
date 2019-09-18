class Olympian < ApplicationRecord
  has_many :olympian_events
  has_many :medals, through: :olympian_events
  has_many :events, through: :olympian_events

  def olympian_stats
    { "total_competiting_olympians" => Olympian.count,
      "average_weight" => {
        "unit" => "kg",
        "male_olympians" => Olympian.average_weight("M").round(2).to_f,
        "female_olympians" => Olympian.average_weight("F").round(2).to_f
      },
      "average_age" => Olympian.average(:age).round(2).to_f
    }
  end

  def total_medals_won
    medals.where("medals.name != 'NA'").count
  end

  def self.age_sorter(youngest_or_oldest, order = "DESC")
    order = "ASC" if youngest_or_oldest == "youngest"
    select(:name, :team, :age, :sport)
    .order("age #{order}")
    .first
  end

  def self.average_weight(sex)
    select(:weight, :sex).where(sex: sex).average(:weight)
  end
end
