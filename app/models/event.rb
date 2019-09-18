class Event < ApplicationRecord
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
  has_many :medals, through: :olympian_events
end
