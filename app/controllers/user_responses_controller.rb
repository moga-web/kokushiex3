class UserResponsesController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      Examination.create_result!(user_id: current_user.id,
                                 test_id: params[:test_id],
                                 attempt_date: DateTime.current,
                                 choice_ids: params[:user_response][:choice_ids]
                                )
      # リダイレクト
      redirect_to dashboard_path, notice: '試験結果を保存しました'
    rescue StandardError => e
      @user_responses = params[:user_response][:choice_ids]
      render :new, alert: '試験結果を保存できませんでした'
    end
  end
end
