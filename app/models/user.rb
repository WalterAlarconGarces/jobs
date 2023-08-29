class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_one_attached :avatar, service: :amazon
  has_many :likes
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
end
