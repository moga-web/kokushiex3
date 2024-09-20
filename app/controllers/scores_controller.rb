class ScoresController < ApplicationController
  def create

  end

  def show
    @examination = Examination.find(params[:examination_id])
    @score = @examination.score

    if @score.nil?
      redirect_to examination_path(@examination), alert: 'スコアが存在しません。'
    end
  end
end
