class UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if params[:next_page] == "page 2"
      redirect_to edit_preferences_path
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :secondary_email, :location, :date_frequency, :day)
  end
end
