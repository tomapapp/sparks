class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
    @recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).order(rating: :desc)
    #location argument to be added
    @top_recommendations = @recommendations.first(4)
  end

  def filtered_index
    @categories = []
    if params[:next]
      new_params = params[:categories]
      new_params.each do |id|
        @categories << Category.find(id.to_i)
      end
      recommendations = []
      @categories.each do |category|
        # outstanding: add location into algorithm
        recommendations << Recommendation.where(category: category)
      end
      @top_recommendations = recommendations.flatten.sort_by { |ab| -ab[:rating] }.drop(4).first(4)
    else
      new_params = params[:search][:category_ids].drop(1)
      new_params.each do |id|
        @categories << Category.find(id.to_i)
      end
      recommendations = []
      @categories.each do |category|
        # outstanding: add location into algorithm
        recommendations << Recommendation.where(category: category)
      end
      @top_recommendations = recommendations.flatten.sort_by { |ab| -ab[:rating] }.first(4)
    end
  end

  def show
    @markers =
    [{
      lat: @recommendation.latitude,
      lng: @recommendation.longitude
    }]
  end

  def surprise_me
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
      redirect_to recommendation_path(@recommendation)
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

  # def add_image
  #   @recommendation.photos.attach(params[:photos])
  # end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:name, :description, :location, photos: [])
  end
end
