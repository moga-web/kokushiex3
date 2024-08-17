class UserResponsesController < ApplicationController
  def create
    @examination = Examination.new(
      user_id: current_user.id,
      test_id: params[:test_id],
      attempt_date: Datetime.current
    )

    params[:user_responses].each do |question_id, choice_ids|
      choice_ids.each do |choice_id|
        UserResponse.create!(
          examination_id: @examination.id,
          choice_id: choice_id
        )
      end
    end

    redirect_to dashboard_path, notice: '試験結果を保存しました'
  end
end
