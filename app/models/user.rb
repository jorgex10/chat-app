class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
end
