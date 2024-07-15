class Neighbour < ApplicationRecord
  belongs_to :plant_1, class_name: "Plant"
  belongs_to :plant_2, class_name: "Plant"
end
