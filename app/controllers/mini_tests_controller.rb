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

  def create
    @selected_answers = Choice.where(id: params[:user_response][:choice_ids])
                              .group_by(&:question_id)
                              .transform_values { |choices| choices.map(&:option_number) }
    @questions = Question.where(id: params[:question_ids])

    respond_to do |format|
      format.turbo_stream
    end
  end
end
