class SightingsController < ApplicationController

  def create
    @animal = Animal.find(params[:animal_id])
    @comment = @animal.sightins.create(params[:sighting].permit(:date, :latitude, :longitude))

    redirect_to animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy

    redirect_to animal_path(@animal)
  end

end
