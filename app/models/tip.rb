class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :content, presence: true
  validates :content, length: { maximum: 255 }
end
