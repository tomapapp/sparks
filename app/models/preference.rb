class Preference < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :category, presence: true
end
