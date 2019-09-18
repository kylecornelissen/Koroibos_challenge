class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: OlympianStatsSerializer.new(Olympian.first)
  end
end
