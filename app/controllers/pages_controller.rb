class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user || User.new
  end

  def my_preferences
    @categories = Category.all
  end

  def my_date_info
    @user = current_user
  end

end
