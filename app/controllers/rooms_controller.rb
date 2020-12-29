class RoomsController < ApplicationController
  def show
    @locations = Location.where(room: params[:id])
      .includes(:packages)
  end
end
