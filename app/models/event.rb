class Event < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
  has_many :medals, through: :olympian_events

  def medalist_info
    no_medal = Medal.where(name: 'NA').first
    events = Event.joins(:olympian_events)
                  .where("olympian_events.event_id = #{self.id} AND olympian_events.medal_id != #{no_medal.id}")
                  .select('olympian_events.medal_id, olympian_events.olympian_id')
    medalist_list(events)
  end

  def medalist_list(events)
    events.map do |event|
      medal = Medal.find(event.medal_id)
      olympian = Olympian.find(event.olympian_id)
      create_medalist_hash(medal, olympian)
    end
  end

  def create_medalist_hash(medal, olympian)
    hash = {
      "name": olympian.name,
      "team": olympian.team,
      "age": olympian.age,
      "medal": medal.name
    }
  end
end
