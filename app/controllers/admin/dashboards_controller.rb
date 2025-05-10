class Admin::DashboardsController < ApplicationController

  before_action :authenticate_admin!
  
  def index
      @users = User.all #ユーザー一覧の表示機能
  end

end
