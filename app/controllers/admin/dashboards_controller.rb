class Admin::DashboardsController < ApplicationController
  layout 'admin' #admin.html.erbを適用するため
  before_action :authenticate_admin! #管理者用の認証
  
  def index
      @users = User.all #ユーザー一覧の表示機能
  end

end
