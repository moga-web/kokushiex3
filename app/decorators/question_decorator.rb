class QuestionDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def incorrect_color(examination)
    selected_option_numbers = selected_choice(examination)
    return 'text-red-300' if selected_option_numbers.empty?

    correct_option_numbers = correct_choices
    selected_option_numbers.sort == correct_option_numbers.sort ? '' : 'text-red-300'
  end
end
