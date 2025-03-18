class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :titre, presence: true
  validates :contenu, length: { maximum: 255 }

  include PgSearch::Model

  pg_search_scope :search_by_titre_and_contenu,
                  against: [:titre, :contenu],
                  using: {
                    tsearch: { prefix: true }
                  }
end
