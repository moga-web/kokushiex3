class AccountsController < ApplicationController
  before_action :authenticate_user!
  def show
    return unless current_user.guest?

    redirect_to tests_select_path, alert: 'ゲストユーザーはアカウント情報を確認できません。'
  end
end
