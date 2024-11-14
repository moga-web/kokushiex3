class QuestionDecorator < Draper::Decorator
  delegate_all
  def result_color(examination)
    return 'text-red-300' if selected_option_numbers(examination).empty?

    selected_option_numbers(examination).sort == correct_option_numbers.sort ? 'text-gray-800' : 'text-red-300'
  end
end
