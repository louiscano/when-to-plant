class NeighboursController < ApplicationController
  before_action :set_neighbour, only: [:show, :edit, :update, :destroy]

  def index
    @neighbours = Neighbour.all
  end

  def show
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @neighbour = @plant.neighbours.build(neighbour_params)
    if @neighbour.save
      redirect_to @plant, notice: 'Le voisin a été ajouté'
    else
      render 'plants/show'
    end
  end

  def update
    if @neighbour.update(neighbour_params)
      redirect_to @neighbour, notice: 'Le voisin a été modifié'
    else
      render :edit
    end
  end

  def destroy
    @neighbour.destroy
    redirect_to neighbours_url, notice: 'Le voisin a été supprimé'
  end

  private

  def set_neighbour
    @neighbour = Neighbour.find(params[:id])
  end

  def neighbour_params
    params.require(:neighbour).permit(:voisin, :plant_1_id, :plant_2_id)
  end
end
