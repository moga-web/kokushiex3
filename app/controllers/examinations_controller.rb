class ExaminationsController < ApplicationController
  before_action :authenticate_user!
  def show
    @examination = current_user.examinations.find(params[:id])
    @score = @examination.score
    @test = @examination.test

    # Eager Loadを使用してN+1問題を解消
    @questions = @test.test_sessions.includes(:questions).flat_map(&:questions)
  end
end
