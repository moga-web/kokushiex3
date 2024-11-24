class MiniTestsController < ApplicationController
  def index
    @questions = MiniTestSearchForm.new(params).search

    @user_responses = []
  end
end
