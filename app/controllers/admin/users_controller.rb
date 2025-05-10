class Admin::UsersController < ApplicationController
  layout 'admin' #admin.html.erbを適用するため
  before_action :authenticate_admin!
  
  def show
    @user = User.find(params[:id])
    @plans = @user.plans
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notie: 'ユーザーを削除しました。'
  end
end
