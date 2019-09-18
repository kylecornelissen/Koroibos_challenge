class Olympian < ApplicationRecord
  def self.age_sorter(youngest_or_oldest, order = "DESC")
    order = "ASC" if youngest_or_oldest == "youngest"
    select(:name, :team, :age, :sport)
    .order("age #{order}")
    .first
  end
end
