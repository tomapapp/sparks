class Recommendation < ApplicationRecord
  belongs_to :category
  has_many :times, dependent: :destroy
  has_many :dates, dependent: :destroy
end
