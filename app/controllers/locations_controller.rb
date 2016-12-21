class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        flash[:success] = 'New location was successfully created.'
        format.html { redirect_to @location }
      else
        flash[:danger] = 'There was a problem creating the location.'
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update(location_params)
        flash[:success] = 'New location was successfully updated.'
        format.html { redirect_to @location }
      else
        flash[:danger] = 'There was a problem updating the location.'
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    @locations = Location.all
  end
  # private: need to be at end of class
  private
    def location_params
      params.require(:location).permit(:name, :description)
    end
end
