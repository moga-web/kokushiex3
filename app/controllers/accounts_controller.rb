class AccountsController < ApplicationController
  before_action :authenticate_user!
  def show
    authorize :account, :show?
  rescue StandardError
    redirect_to tests_select_path, alert: 'ゲストユーザーはアカウント情報を確認できません。'
  end
end
