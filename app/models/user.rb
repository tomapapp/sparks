class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :datenights
  has_many :preferences, dependent: :destroy
  has_many :recommendations, through: :datenights
  has_many :times, through: :recommendations
  has_many :categories, through: :preferences
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  after_create :send_welcome_email

  def next_date_night
  # check when last date night was
  last_date_night = datenights.order(:day_of_date).last
  # check frequency & see whether it is in the past or not
  if last_date_night
    next_date = last_date_night.day_of_date + date_frequency.weeks
    return next_date if next_date > Date.today
  end
  # if future next date night
  # return Date.today.next_occurring(day.downcase.to_sym)
  # if not pick next days.
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
