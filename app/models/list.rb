class List < ApplicationRecord
  belongs_to :user
  # has_many :plant_lists
  validates :nom, presence: true
end
