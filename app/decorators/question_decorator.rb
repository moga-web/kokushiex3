class QuestionDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def incorrect_color(examination)
    selected_choice_ids = selected_choice(examination)
    return 'text-red-300' if selected_choice_ids.empty?

    correct_choice_ids = correct_choices.pluck(:id)
    selected_choice_ids.sort == correct_choice_ids.sort ? '' : 'text-red-300'
  end
end
