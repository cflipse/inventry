class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
    if params[:package]
      @package.attributes = package_params.except(:notes)
    end
  end

  def create
    @package = Package.new(package_params)

    if @package.save
      redirect_to new_package_path(package: package_params)
    else
      render :new
    end
  end

  private

  def package_params
    params.require(:package)
      .permit(:food_id, :location_id, :producer, :store, :quantity, :notes)
  end
end
