class ProfilesController < ApplicationController
  def couple_profile
    @datenights = current_user.datenights
  end
end
