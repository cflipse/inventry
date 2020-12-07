class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new(flash[:prefill_package])
  end

  def create
    @package = Package.new(package_params)

    if @package.save
      flash[:prefill_package] = package_params.except(:notes)
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
