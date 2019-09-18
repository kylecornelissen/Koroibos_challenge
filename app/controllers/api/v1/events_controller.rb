class Api::V1::EventsController < ApplicationController
  def index
    render json: { "events": SportSerializer.new(Sport.order_events) }
  end
end
