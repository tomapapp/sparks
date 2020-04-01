class RecommendationsController < ApplicationController

  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :signup_redirection
  before_action :set_new_review, only: [:show, :surprise_me]

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
        recommendations << Recommendation.where(category: category).near(current_user.location, 10)
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
        recommendations << Recommendation.where(category: category).near(current_user.location, 10)
      end
      @top_recommendations = recommendations.flatten.sort_by { |ab| -ab[:rating] }.first(4)
    end
      set_markers
  end

  def preference_index
    @categories = []
    current_user.preferences.each do |preference|
      @categories << preference.category
    end
    if params[:next]
      recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).near(current_user.location, 10)
      @top_recommendations = recommendations.order(rating: :desc).drop(4).first(4)
    else
      recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).near(current_user.location, 10)
      @top_recommendations = recommendations.order(rating: :desc).first(4)
    end
    set_markers
  end

  def show
    @review = Review.new
    @review.user = current_user
    @markers =
    [{
      lat: @recommendation.latitude,
      lng: @recommendation.longitude
    }]
    load_reviews
  end

  def surprise_me
    @review = Review.new
    @review.user = current_user
    recommendations = Recommendation.where(category: current_user.preferences.map(&:category)).near(current_user.location, 10)
    @top_recommendations = recommendations.order(rating: :desc)
    @recommendation = @top_recommendations.first
    @markers =
      [{
      lat: @recommendation.latitude,
      lng: @recommendation.longitude
      }]
    load_reviews
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

  def set_markers
    @top_recommendations = Recommendation.where(id: @top_recommendations.map(&:id))
    @recommendations = @top_recommendations.geocoded #returns flats with coordinates
    @markers = @recommendations.map do |recommendation|
      {
        lat: recommendation.latitude,
        lng: recommendation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { recommendation: recommendation })
      }
    end
  end

  def set_new_review
    @review = Review.new
  end

  def load_reviews
    @datenight = @recommendation.datenights.where(user: current_user).last
    @reviews = Review.where(datenight: @recommendation.datenights)
  end
end
