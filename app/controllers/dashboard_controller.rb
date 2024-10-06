class DashboardController < ApplicationController
  def index
    # current_userの最新のexamaminationを取得
    @latest_examination = current_user.examinations.order(created_at: :desc).first
    
    # ... 他のコード ...
  end
end
