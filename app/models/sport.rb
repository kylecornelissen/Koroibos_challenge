class Sport < ApplicationRecord
  has_many :events

  def self.order_events
    order(:name)
  end
end
