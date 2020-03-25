class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dates
  has_many :preferences, dependent: :destroy
  has_many :recommendations, through: :dates
  has_many :times, through: :recommendations
  has_many :categories, through: :preferences
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
