class MiniTestsController < ApplicationController
  def index
    form = MiniTestSearchForm.new(params)
    if form.valid?
      @questions = form.search
      @user_responses = []
    else
      redirect_to tests_select_path, alert: form.errors.full_messages.join(', ')
    end
  end
end
