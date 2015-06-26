class SightingsController < ApplicationController

  # ISNECUD

  def index
    @sightings = Sighting.all
    @sighting = @animal.sightings.find(params[:id])
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new

  end

  def edit
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.create(params[:sighting].permit(:date, :latitude, :longitude, :region_id))
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to animal_path(@animal), notice: "Succesfully created sighting for date of: '#{@sighting.date}'"
    else
      render 'new'
    end
  end

  def update
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    if @sighting.update(params[:sighting].permit(:date, :latitude, :longitude))
      redirect_to @animal.sighting, notice: "succesfully updated sighting for date of '#{@sighting.date}'"
    else
      render 'edit'
    end
  end

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@animal), notice: "Succesfully deleted sighting for date of: '#{@sighting.date}'"
  end

  private

  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude)
  end

end
