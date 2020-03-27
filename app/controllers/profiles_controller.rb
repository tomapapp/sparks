class ProfilesController < ApplicationController
  def couple_profile
    @datenights = []
    @current_user_datenights = current_user.datenights
    @current_user_datenights.each do |datenight|
      if datenight.time < DateTime.now
        @datenights << datenight
      end
    end
    @datenights
  end
end
