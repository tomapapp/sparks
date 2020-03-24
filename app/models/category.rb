class Category < ApplicationRecord
  has_many :recommendations
  has_many :preferences

  validates :name, presence: true
  # validates :name, inclusion: { in: [cat1, cat2]},
end
