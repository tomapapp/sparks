class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_user, only: [:date_frequency, :my_date_info]

  def home
    # @user = current_user || User.new
    # @datenights = Datenight.all
    # getting the date id to redirect to the correct page
    @user = current_user
    if @user
      if @user.datenights.last
        date_id = @user.datenights.last.id
        redirect_to datenight_path(date_id)
      elsif @user.preferences.last
        redirect_to edit_date_info_path
      elsif @user.date_frequency
        redirect_to edit_preferences_path
      else
        redirect_to date_frequency_path
      end
    end

    # if params.nil?
    #   # params will be nil if the user hasn't gone through date night booking
    #   redirect_to root_path
    # else
    #   # passing date night id, redirecting to show page
    #   redirect_to datenight_path(date_id)
    # end
  end

  def date_frequency
    if current_user == nil
      redirect_to root_path
    end
  end

  def my_preferences
    if current_user == nil
      redirect_to root_path
    elsif current_user.date_frequency == nil
      redirect_to date_frequency_path
    end
    # getting all the categories to display them in the form
    @categories = Category.all
  end

  def add_preferences
    new_params = params[:user][:preferences].drop(1)
    if new_params.empty?
      redirect_to edit_preferences_path, flash: { alert: "You need to select at least one preference" }
    else
      new_params.each do |preference|
        category = Category.find(preference)
        Preference.create(user: current_user, category: category)
      end
      redirect_to edit_date_info_path
    end
  end

  def edit_preferences
    @categories = Category.all
    @preferences = current_user.preferences
  end

  def update_preferences
    current_user.preferences.destroy_all
    new_params = params[:user][:preferences].drop(1)
    if new_params.empty?
      redirect_to update_preferences_path, flash: { alert: "You need to select at least one preference" }
    else
      new_params.each do |preference|
        category = Category.find(preference)
        Preference.create(user: current_user, category: category)
      end
      redirect_to edit_date_info_path
    end
  end

  def my_date_info
    if current_user == nil
      redirect_to root_path
    elsif current_user.date_frequency == nil
      redirect_to date_frequency_path
    elsif current_user.preferences.empty?
        redirect_to edit_preferences_path
    end
  end

  def pick_a_category
    @categories = Category.all
  end

  private

  def set_user
    @user = current_user
  end
end
