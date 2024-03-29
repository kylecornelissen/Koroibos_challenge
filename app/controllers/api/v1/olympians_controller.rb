class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age]
      render json: OlympianSerializer.new(Olympian.age_sorter(params[:age]))
    else
      render json: OlympianSerializer.new(Olympian.all)
    end
  end
end
