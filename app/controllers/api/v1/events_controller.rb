class Api::V1::EventsController < ApplicationController
  def index
    render json: { "events": SportSerializer.new(Sport.order_events) }
  end

  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end
end
