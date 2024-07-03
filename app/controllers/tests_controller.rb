class TestsController < ApplicationController
  def show
    @test = Test.find(1)
  end
end
