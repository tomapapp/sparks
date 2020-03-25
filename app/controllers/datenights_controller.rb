class DatenightsController < ApplicationController
  before_action :set_datenight, only: [:show, :edit, :destroy]

  def index
    @datenights = Datenight.all
  end

  def show
  end

  def new
    @datenight = Datenight.new
    @recommendation = Recommendation.find(params[:recommendation_id])
  end

  def create
    @datenight = Datenight.new(datenight_params)
    # @datenight.day_of_date = current_user.chosen_date
    @recommendation = Recommendation.find(params[:recommendation_id])
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
    @datenight = Datenight.update(datenight_params)
    if @datenight.save
      redirect_to datenight_path(@datenight)
    else
      render :edit
    end
  end

  def destroy
    @datenight.destroy
    redirect_to category_recommendation_datenights_path
  end

  private

  def datenight_params
    params.require(:datenight).permit(:time, :day_of_date)
  end

  def set_datenight
    @datenight = Datenight.find(params[:id])
  end
end
