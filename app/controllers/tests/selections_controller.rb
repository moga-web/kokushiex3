class Tests::SelectionsController < ApplicationController
  def index
    @tests = Test.all.decorate
  end
end
