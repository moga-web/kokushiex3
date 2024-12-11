class TestsController < ApplicationController
  before_action :authenticate_user!
  def show
    @test = Test.find(params[:id]).decorate
    @test_sessions = @test.test_sessions.includes(questions: %i[choices tags])
    # N+1問題を解決するために、事前に読み込んだquestionsを使用
    @questions = @test_sessions.flat_map(&:questions).map(&:decorate)
    @user_responses = []
  end
end
