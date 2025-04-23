class UsersController < ApplicationController
  def show
    @user = current_user
  end


  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
