class MiniTestsController < ApplicationController
  before_action :authenticate_user!
  def index
    form = MiniTestSearchForm.new(params)
    authorize :mini_test, :index?
    if form.valid?
      @questions = form.search
      @user_responses = []
    else
      redirect_to tests_select_path, alert: form.errors.full_messages.join(', ')
    end
  end

  def create
    @selected_answers = Choice.mini_test_answers(params[:user_response][:choice_ids])
    @questions = Question.where(id: params[:question_ids])

    respond_to do |format|
      format.turbo_stream
    end
  end
end
