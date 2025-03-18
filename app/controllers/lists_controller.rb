class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.where(user: current_user)
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @plant = Plant.find(params[:list][:plant])
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      PlantList.create!(list: @list, plant: @plant)
      redirect_to @plant, notice: 'Votre liste a été créée !'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path, notice: 'Votre liste a été renommée !'
    else
      render  '/lists'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url, notice: 'Votre liste a été supprimée !'
  end

  def remove_plant
    @plant_list = PlantList.find(params[:id])
    @plant_list.destroy
    redirect_to lists_path, notice: 'Plante retirée de la liste avec succès.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:nom, :user_id)
  end
end
