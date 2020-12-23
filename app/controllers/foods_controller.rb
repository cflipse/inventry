class FoodsController < ApplicationController
  def index
    @foods = Food.in_stock.order(:category, :name)
    @counts = Package.food_counts
  end
end
