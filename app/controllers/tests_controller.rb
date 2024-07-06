class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    @question = @test.questions.first
  end
end
