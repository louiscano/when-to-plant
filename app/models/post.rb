class Post < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :title, length: { maximum: 255 }
  validates :content, length: { maximum: 100000 }
end
