class Api::V1::OlympiansController < ApplicationController
  def index
    render json: OlympianSerializer.new(Olympian.all)
  end

  def show
    render json: OlympianSerializer.new(Olympian.find(params[:id]))
  end
end
