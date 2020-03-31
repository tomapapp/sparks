class Datenight < ApplicationRecord
  belongs_to :recommendation
  belongs_to :user
  has_many :reviews, dependent: :destroy


  def datenight_info_string
    " You are invited at #{recommendation.name}\n, the adress is : #{recommendation.location}\n, the date and time is : #{time}"
  end
end

