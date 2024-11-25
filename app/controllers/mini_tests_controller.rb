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

  private

  def search_params
    params.require(:search).permit(tag_ids: [], question_count: nil)
  end
end
