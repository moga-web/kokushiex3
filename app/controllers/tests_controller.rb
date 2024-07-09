class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id]).decorate
    @questions = @test.questions.includes(:choices)
  end
end
