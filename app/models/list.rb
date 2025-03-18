class List < ApplicationRecord
  belongs_to :user
  has_many :plant_lists, dependent: :destroy
  validates :nom, presence: true
end
