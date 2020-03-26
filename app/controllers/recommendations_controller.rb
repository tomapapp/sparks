class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    @recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).order(rating: :desc)
    #location argument to be added
    @top_recommendations = @recommendations.first(4)
  end

  def show
    @recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).order(rating: :desc)
    @recommendation = @recommendations.first
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.category = @category
    if @recommendation.save
      redirect_to category_recommendation_path(@category, @recommendation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recommendation.update(recommendation_params)
      redirect_to category_recommendation_path(@recommendation)
    else
      render :edit
    end
  end

  def destroy
    @recommendation.destroy
    redirect_to category_recommendations_path
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:name, :description, :location, :photo)
  end
end
