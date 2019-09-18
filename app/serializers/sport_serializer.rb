class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :events do |sport|
    sport.events.map do |event|
      event[:name]
    end
  end
end
