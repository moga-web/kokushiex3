class MiniTestsController < ApplicationController
  def index
    Rails.logger.debug(params.inspect)
    @questions = MiniTestSearchForm.new(params[:search]).search

    @user_responses = []
  end
end
