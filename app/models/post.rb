class Post < ApplicationRecord
  has_many :comments
  has_many_attached :photos

  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { maximum: 255 }
  validates :content, length: { maximum: 100000 }

  extend FriendlyId
  friendly_id :nom, use: :slugged
end
