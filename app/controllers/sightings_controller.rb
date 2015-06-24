class SightingsController < ApplicationController

  def create
    @animal = Animal.find(params[:animal_id])
    @comment = @animal.sightings.create(params[:sighting].permit(:date, :latitude, :longitude, :region_id))
    # @sighting = @animal.sightings.find(params[:id])
    @sighting = Sighting.new(sighting_params)

    redirect_to animal_path(@animal), notice: "Succesfully created sighting for date of: '#{@sighting.date}'"
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy

    redirect_to animal_path(@animal), notice: "Succesfully deleted sighting for date of: '#{@sighting.date}'"
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def edit
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(params[:sighting].permit(:date, :latitude, :longitude))
      redirect_to @sighting, notice: "succesfully updated sighting for date of '#{@sighting.date}'"
    else
      render 'edit'
    end
  end


  private

  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude)
  end


  end
