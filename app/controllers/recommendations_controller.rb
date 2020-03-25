class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:show, :edit, :destroy]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    @recommendations = Recommendation.all
  end

  def show
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
    @recommendation = Recommendation.update(recommendation_params)
    @recommendation.category = @category
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

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:name, :description, :location)
  end
end
