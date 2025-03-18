class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy, :update_tip]
  before_action :set_plant, only: [:create, :update_tip]

  def index
    @tips = Tip.all
  end

  def show
  end

  def edit
  end

  def create
    @tip = @plant.tips.build(tip_params)
    @tip.user = current_user
    @tip.status = "En attente"
    if @tip.save
      redirect_to @plant, notice: 'Votre conseil a bien été envoyé !'
    else
      render 'plants/show', status: :unprocessable_entity
    end
  end

  def update
    if @tip.update(tip_params)
      redirect_to @tip, notice: 'Votre conseil a bien été modifié !'
    else
      render :edit
    end
  end

  def destroy
    @tip.destroy
    redirect_to plant_path(@tip.plant), notice: 'Votre conseil a bien été supprimé !'
  end

  def edit_tip
    @tip = Tip.find(params[:tip])
    @edit_tip_id = @tip.id
    @plant = Plant.find(params[:plant_id])
    @tip = Tip.new
    @tips = Tip.where(plant: @plant)
    @list = List.new
    @lists = List.where(user: current_user)
    @bon_voisin = Neighbour.where(plant_1: @plant)
    render 'plants/show'
  end

  def update_tip
    if @tip.update(tip_params)
      redirect_to @plant, notice: 'Votre conseil a bien été modifié !'
    else
      @edit_tip_id = @tip.id
      render 'plants/show'
    end
  end

  private

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def tip_params
    params.require(:tip).permit(:titre, :contenu)
  end
end
