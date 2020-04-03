class ReviewsController < ApplicationController
  before_action :set_datenight, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recommendation = @datenight.recommendation
    @review.datenight = @datenight
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to profiles_couple_profile_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_datenight
    @datenight = Datenight.find(params[:datenight_id])
  end

  def review_params
    params.require(:review).permit(:content, :date_rating)
  end
end
