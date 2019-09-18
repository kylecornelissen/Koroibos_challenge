class Api::V1::OlympianStatsController < ApplicationController
  def show
    render json: OlympianStatsSerializer.new(Olympian.first)
  end
end
