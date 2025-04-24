class UsersController < ApplicationController

  def mypage
    @user = current_user
    @plans = @user.plans
    render :show
  end

  def show
    @user = User.find(params[:id])
    @plans = @user.plans
  end


  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
