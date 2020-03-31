class Review < ApplicationRecord
  belongs_to :user
  belongs_to :datenight
  validates :content, presence: true
  validates :date_rating, presence: true
end
