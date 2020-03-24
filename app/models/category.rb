class Category < ApplicationRecord
  has_many :recommendations, dependent: :destroy
  has_many :preferences, dependent: :destroy
  validates :name, presence: true
  # validates :name, inclusion: { in: [cat1, cat2]},
end
