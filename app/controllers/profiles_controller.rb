class ProfilesController < ApplicationController
  def couple_profile
    # Returning all the date nights to display
    @datenights = []
    @current_user_datenights = current_user.datenights
    @current_user_datenights.each do |datenight|
      if datenight.time < DateTime.now
        @datenights << datenight
      end
    end
    @datenights

    # Returning the badge
    @user_badge = user_badge
  end

  private

  def user_badge
    if current_user.datenights.count <= 2
      user_badge = ["badge-beginner", "Date Night Beginners", "badge-pro", "Date Night Pros"]
    elsif current_user.datenights.count <= 4
      user_badge = ["badge-pro", "Date Night Pros", "badge-expert", "Date Night Experts"]
    elsif current_user.datenights.count > 6
      user_badge = ["badge-expert", "Date Night Experts", "badge-shaolin", "Date Night Shaolins"]
    end
  end

end
