class DatenightsController < ApplicationController
  before_action :set_datenight, only: [:show, :edit, :update, :destroy]
  before_action :set_recommendation, only: [:new, :create, :edit, :update, :destroy]

  def index
    @datenights = Datenight.all
  end

  def show
  end

  def new
    @datenight = Datenight.new
  end

  def create
    @datenight = Datenight.new(datenight_params)
    # @datenight.day_of_date = current_user.chosen_date
    @datenight.user = current_user
    @datenight.recommendation = @recommendation
    if @datenight.save
      redirect_to datenight_path(@datenight)
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
end
