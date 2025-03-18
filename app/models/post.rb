class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_rich_text :rich_body
  has_one_attached :photo

  validates :titre, presence: true
  validates :titre, length: { maximum: 255 }
  validates :contenu, length: { maximum: 100000 }

  extend FriendlyId
  friendly_id :titre, use: :slugged

  include PgSearch::Model
  pg_search_scope :search_by_titre_and_contenu_and_categorie,
                  against: [:titre, :contenu, :categorie],
                  using: {
                    tsearch: { prefix: true }
                  }

  def slug
    titre.to_s.parameterize
  end

  def should_generate_new_friendly_id?
    titre_changed?
  end
end
