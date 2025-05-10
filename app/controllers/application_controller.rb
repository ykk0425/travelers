class ApplicationController < ActionController::Base
  #ログイン認証が成功していないと、トップ/アバウトページ以外の画面(ログイン/サインアップ除く)表示されないように
  #エンドユーザー側のauthenticate_user!フィルターが適用されないように。かわりに管理者用コントローラで認証（authenticate_admin!)する
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_controller? 
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def admin.controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image])
  end

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_update_path_for(resource)
    mypage_path
  end
  
end
