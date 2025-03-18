class PlantsController < ApplicationController
  before_action :set_plant, only: [:show]

  def index
    @plants = Plant.all
    @plants = @plants.where(categorie: params[:categorie]) if params[:categorie].present?
    @plants = @plants.where("type_semis ILIKE ?", "%#{params[:type_semis]}%") if params[:type_semis].present?
    @plants = @plants.where("periode_semis ILIKE ?", "%#{params[:periode_semis]}%") if params[:periode_semis].present?
    @plants = @plants.where("periode_recoltes ILIKE ?", "%#{params[:periode_recoltes]}%") if params[:periode_recoltes].present?
    @plants = @plants.where("culture ILIKE ?", "%#{params[:culture]}%") if params[:culture].present?
    @plants = @plants.where(besoin_eau: params[:besoin_eau]) if params[:besoin_eau].present?
    @plants = @plants.where("qualite_sol ILIKE ?", "%#{params[:qualite_sol]}%") if params[:qualite_sol].present?
    @plants = @plants.where("nature_sol ILIKE ?", "%#{params[:nature_sol]}%") if params[:nature_sol].present?
    @plants = @plants.where(hauteur: params[:hauteur]) if params[:hauteur].present?
    @plants = @plants.where(temperature: params[:temperature]) if params[:temperature].present?
    @plants = @plants.where(difficulte: params[:difficulte]) if params[:difficulte].present?
    if params[:query].present?
      @plants = Plant.search_by_name_and_description(params[:query])
    end
  end

  def show
    @tip = Tip.new
    @tips = Tip.where(plant: @plant)
    @list = List.new
    @lists = List.where(user: current_user)
    @bon_voisin = Neighbour.where(plant_1: @plant)
  end

  def create
    @plant = Plant.new(list_params)
    @plant.save
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :nom_scientifique, :famille, :categorie, :type_semis,
                                  :conseil_semis, :conseil_culture, :periode_semis, :periode_recoltes, :culture,
                                  :exposition, :besoin_eau, :nature_sol, :qualite_sol, :hauteur, :maladie, :ecart_rang,
                                  :temperature, :difficulte, :categorie, :query, photos: [])
  end
end
