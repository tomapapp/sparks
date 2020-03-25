class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_preferences
    # getting all the categories to display them in the form
    @categories = Category.all
  end

  def add_preferences
    params[:user][:preferences].each do |preference|
      category = Category.find_by(name: preference)
      Preference.create(user: current_user, category: category)
    end
    redirect_to edit_date_info_path
  end

  def my_date_info
    @user = current_user
  end

end
