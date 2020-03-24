class Recommendation < ApplicationRecord
  belongs_to :category
  has_many :times
  has_many :dates
end
