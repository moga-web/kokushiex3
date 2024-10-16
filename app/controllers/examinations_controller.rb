class ExaminationsController < ApplicationController
  def show
    @examination = Examination.find(params[:id])
    # examinationのscoreを取得
    @score = @examination.score if @examination
    @test = @examination.test
    test_sessions = @test.test_sessions
    @questions = test_sessions.flat_map { |session| session.questions.includes(:choices) }
    @user_responses = @examination.user_responses.includes(:choice)
  end
end
