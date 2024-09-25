class ScoresController < ApplicationController
  def show
    @examination = Examination.find(params[:examination_id])
    @score = @examination.score

    return unless @score.nil?

    redirect_to examination_path(@examination), alert: 'スコアが存在しません。'
  end

  def create(examination_id, scores)
    examination = Examination.find(examination_id)
    score = examination.build_score(
      total_score: scores[:total],
      common_score: scores[:common],
      practical_score: scores[:practical]
    )
    Rails.logger.error "スコアの登録に失敗しました: #{score.errors.full_messages.join(', ')}" unless score.save
  end
end
