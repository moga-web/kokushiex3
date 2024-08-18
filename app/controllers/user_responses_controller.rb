class UserResponsesController < ApplicationController
  def create
    @examination = Examination.create!(
      user_id: current_user.id,
      test_id: params[:test_id],
      attempt_date: DateTime.current
    )
    unless @examination.persisted?
      Rails.logger.error "Examination was not saved"
      redirect_to some_path, alert: "Failed to create examination."
      return
    end

    user_responses = params[:user_response][:choice_ids].map do |choice_id|
      {
        examination_id: @examination.id,
        choice_id: choice_id,
        created_at: DateTime.current,
        updated_at: DateTime.current
      }
    end
    
    UserResponse.insert_all(user_responses)
    redirect_to dashboard_path, notice: '試験結果を保存しました'
  end
end
