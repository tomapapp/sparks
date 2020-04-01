class DatenightsController < ApplicationController
  before_action :set_datenight, only: [:show, :edit, :update, :destroy]
  before_action :set_recommendation, only: [:new, :create, :edit, :update, :destroy]
  before_action :signup_redirection

  def index
    @datenights = Datenight.all
  end

  def show
    @user_badge = user_badge
    # today = Date.today
    # date_night = @datenight.day_of_date.to_i
  end

  def new
    @datenight = Datenight.new
    @datenight.day_of_date = current_user.next_date_night
  end

  def create
    @datenight = Datenight.new(datenight_params)
    #@datenight.day_of_date = current_user.chosen_date
    @datenight.user = current_user
    @datenight.recommendation = @recommendation
    if @datenight.save
      # redirect is now to root path, then redirect in pages controller
      redirect_to root_path(datenight_params)
    else
      render "recommendations/show"
    end
  end

  def edit
  end

  def update
    if @datenight.update(datenight_params)
      redirect_to datenight_path(@datenight)
    else
      render :edit
    end
  end

  def destroy
    @datenight.destroy
    redirect_to root_path
  end

  private

  def datenight_params
    params.require(:datenight).permit(:time, :day_of_date)
  end

  def set_datenight
    @datenight = Datenight.find(params[:id])
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:recommendation_id])
  end

  def signup_redirection
    if current_user == nil
      redirect_to root_path
    else
      if current_user.date_frequency == nil
        redirect_to date_frequency_path
      elsif current_user.preferences.empty?
        redirect_to edit_preferences_path
      elsif current_user.location == nil
        redirect_to edit_date_info_path
      end
    end
  end

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
