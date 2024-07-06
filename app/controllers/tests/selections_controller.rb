class Tests::SelectionsController < ApplicationController
  def index
    @test = Test.all
  end
end
