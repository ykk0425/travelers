# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  layout 'admin' #admin.html.erbを適用するため
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def after_sign_in_path_for(resource) #ログイン後のリダイレクト先 
    admin_dashbords_path
  end

  def after_sign_out_path_for(resource) #ログアウト後のリダイレクト先
    new_admin_session_path
  end
end
