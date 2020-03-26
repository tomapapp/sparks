class UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # call function to manage redirection depending on stage of onboarding
    redirect_next_page
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :secondary_email, :location, :date_frequency, :day)
  end

  def redirect_next_page
    # uses the hidden tag :next_page to redirect to correct page
    if params[:next_page] == "page 2"
      redirect_to edit_preferences_path
    elsif params[:next_page] == "page 3"
      redirect_to edit_date_info_path
    elsif params[:next_page] == "surprise"
      redirect_to recommendation_path
    elsif params[:next_page] == "list"
      redirect_to category_recommendation_path
    end
  end
end
