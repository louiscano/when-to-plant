class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :contenu, presence: true
  validates :contenu, length: { maximum: 255 }
end
