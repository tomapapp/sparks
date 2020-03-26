class Recommendation < ApplicationRecord
  belongs_to :category
  has_many :times #dependent: :destroy
  has_many :datenights #dependent: :destroy
  has_many :datenights, dependent: :destroy
  has_many_attached :photos
end
