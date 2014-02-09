class UsersController < ApplicationController
  def update
    @user = current_user

    @user.update_attributes!(user_params)
    redirect_to accounts_path
  end

  def user_params
    params.require(:user).permit(:instagram_user, :instagram_abuser, :gmail_user, :gmail_abuser)
  end
end
