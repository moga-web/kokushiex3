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

  def create # rubocop:disable Metrics/MethodLength
    @selected_answers = Choice.where(id: params[:user_response][:choice_ids])
                              .group_by(&:question_id)
                              .transform_values { |choices| choices.map(&:option_number) }
    @questions = Question.where(id: params[:question_ids])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('mini_test_answers',
                                                  partial: 'mini_tests/answers',
                                                  locals: { selected_answers: @selected_answers,
                                                            questions: @questions })
        format.html
      end
    end
  end
end
