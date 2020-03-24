class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:show, :edit, :destroy]

  def index
    @recommendations = Recommendation.all
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @recommendation = Recommendation.new
  end

  def create
    @category = Category.find(params[:category_id])
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
    @recommendation = Recommendation.update(recommendation_params)
    if @recommendation.save
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

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:name, :description, :location)
  end
end
