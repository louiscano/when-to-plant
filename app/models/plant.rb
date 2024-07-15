class Plant < ApplicationRecord
  has_many :tips
  has_many :lists, through: :plant_lists
  has_many :neighbours
  has_many_attached :photos
end
