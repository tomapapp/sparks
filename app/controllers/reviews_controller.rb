class ReviewsController < ApplicationController
  before_action :set_datenight, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  end

  private

  def set_datenight
    @datenight = Datenight.find(params[:datenight_id])
  end

  def review_params
    params.require(:review).permit(:content, :date_rating)
  end


end
