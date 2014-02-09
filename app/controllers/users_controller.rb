class UsersController < ApplicationController
  def index
  end

  def update
    @user = current_user
    @user.update_attributes!(user_params)
    redirect_to events_path
  end

  def user_params
    params.require(:user).permit(:instagram_user, :instagram_abuser)
  end

end
