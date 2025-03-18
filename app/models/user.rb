class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validate :correct_avatar_mime_type
  validate :acceptable_avatar_size


  has_many :tips
  has_many :comments
  has_many :lists


  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def admin?
    role == 'admin'
  end

  private

  def correct_avatar_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png image/jpg))
      errors.add(:avatar, 'must be a JPEG or PNG')
    end
  end

  def acceptable_avatar_size
    if avatar.attached? && avatar.byte_size > 5.megabytes
      errors.add(:avatar, 'is too big')
    end
  end
end
