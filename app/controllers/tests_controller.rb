class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id]).decorate
    @questions = @test.questions.includes(:choices)
    # 解答を保持するためにuser_responseを持たせたいが、初回にエラーが出ないように空配列を渡す
    @user_responses = []
  end
end
