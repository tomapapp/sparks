class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:index, :new, :create, :edit, :update]

  def index
    @recommendations = Recommendation.all
    #   @tailored_recommendation = Recommendation.where()
  end

  def show
    @markers =
      [{
      lat: @recommendation.latitude,
      lng: @recommendation.longitude
      }]
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
