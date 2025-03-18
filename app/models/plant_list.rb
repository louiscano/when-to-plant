class PlantList < ApplicationRecord
  belongs_to :plant
  belongs_to :list

  validates :plant_id, uniqueness: { scope: :list_id, alert: "La plante est déjà dans votre liste" }
end
