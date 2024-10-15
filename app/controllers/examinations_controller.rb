class ExaminationsController < ApplicationController
  def show
    @examination = Examination.find(params[:id])
    # examinationのscoreを取得
    @score = @examination.score if @examination
  end
end
