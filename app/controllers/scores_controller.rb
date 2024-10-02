class ScoresController < ApplicationController
  def show
    @examination = Examination.find(params[:examination_id])
    @score = @examination.score

    return unless @score.nil?

    redirect_to examination_path(@examination), alert: 'スコアが存在しません。'
  end

  def create
    examination = Examination.find(params[:examination_id])
    score_params = params.require(:scores).permit(:total, :common, :practical)

    score = examination.build_score(
      total_score: score_params[:total],
      common_score: score_params[:common],
      practical_score: score_params[:practical]
    )
    Rails.logger.error "スコアの登録に失敗しました: #{score.errors.full_messages.join(', ')}" unless score.save
  end
end
