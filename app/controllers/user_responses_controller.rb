class UserResponsesController < ApplicationController
  def create
    @examination = Examination.create!(user_id: current_user.id,
                                       test_id: params[:test_id],
                                       attempt_date: DateTime.current)
    if UserResponse.bulk_create_responses(@examination.id, params[:user_response][:choice_ids])

      score = @examination.build_score
      if score.calculate_scores(@examination)
        redirect_to dashboard_path, notice: '試験結果を保存しました'
      end
    else
      @user_responses = params[:user_response][:choice_ids]
      render :new, alert: '試験結果を保存できませんでした'
    end
  end
end
