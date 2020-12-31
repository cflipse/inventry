class RoomsController < ApplicationController
  def index
    @foods = Food.in_stock.order(:category, :name)
    @counts = Package.food_counts

    @locations = Location.includes(packages: :food)
  end

  def show
    @locations = Location.where(room: params[:id])
      .includes(packages: :food)
  end
end
