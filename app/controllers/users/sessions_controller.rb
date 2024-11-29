# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
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

  def guest_sign_in
    user = User.create_guest
    sign_in user
    redirect_to tests_select_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_sign_out
    return unless current_user.guest?

    current_user.destroy
    sign_out current_user
    redirect_to root_path, notice: 'ゲストユーザーからログアウトしました。'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
