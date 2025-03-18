class Plant < ApplicationRecord
  has_many :tips
  has_many :lists, through: :plant_lists
  has_many :neighbours
  has_many_attached :photos

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
                  against: [:name, :categorie],
                  using: {
                    tsearch: { prefix: true }
                  }
end
