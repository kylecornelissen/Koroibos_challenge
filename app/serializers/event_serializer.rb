class EventSerializer
  include FastJsonapi::ObjectSerializer
  attribute :event do |event|
    event.name
  end

  attribute :medalists do |event|
    event.medalist_info
  end
end
