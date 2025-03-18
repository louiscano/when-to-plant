class PlantListsController < ApplicationController
  before_action :set_plant_list, only: [:show, :update, :destroy]

  def index
    @plant_lists = PlantList.all
  end

  def show
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @list = List.find(params[:list_id])
    @lists = List.where(user: current_user)
    @tip = Tip.new
    @tips = Tip.where(plant: @plant)
    @bon_voisin = Neighbour.where(plant_1: @plant)
    @plant_list = PlantList.new
    @plant_list.plant = @plant
    @plant_list.list = @list
    if @plant_list.save
      redirect_to @plant, notice: 'La plante a été ajoutée à votre liste'
    else
      render 'plants/show', notice: "La plante est déjà dans votre liste"
    end
  end

  def update
    if @plant_list.update(plant_list_params)
      redirect_to @plant_list, notice: 'La plante a été modifiée dans votre liste'
    else
      render :edit
    end
  end

  def destroy
    @plant_list.destroy
    redirect_to lists_path, notice: 'La plante a été supprimée de votre liste'
  end

  private

  def set_plant_list
    @plant_list = PlantList.find(params[:id])
  end
end
