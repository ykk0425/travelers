class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
    @plans = @user.plans
    render :show
  end
 
  def show
    @user = User.find(params[:id])
    @plans = @user.plans
  end

  def index
    @users = User.where.not(email: 'guest@example.com')
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
  
end
