class AnimalsController < ApplicationController

  def index
    @animals = Animal.all.order("created_at DESC")
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal
    else
      render 'new'
    end
  end

  def new
    @animal = Animal.new
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(params[:animal].permit(:name))
      redirect_to @animal, notice: "updated '#{@animal.name}' successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      redirect_to root_path, notice: "deleted '#{@animal.name}' successfully"
    else
      render 'show'
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name)
  end

end
