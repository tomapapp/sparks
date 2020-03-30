class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user || User.new
    @datenights = Datenight.all
    # getting the date id to redirect to the correct page
    date_id = current_user.datenights.last.id
    if params.nil?
      # params will be nil if the user hasn't gone through date night booking
      redirect_to root_path
    else
      # passing date night id, redirecting to show page
      redirect_to datenight_path(date_id)
    end
  end

  def my_preferences
    # getting all the categories to display them in the form
    @categories = Category.all
  end

  def add_preferences
    new_params = params[:user][:preferences].drop(1)
    new_params.each do |preference|
      category = Category.find(preference)
      Preference.create(user: current_user, category: category)
    end
    redirect_to edit_date_info_path
  end

  def my_date_info
    @user = current_user
  end

  def pick_a_category
    @categories = Category.all
  end

end
