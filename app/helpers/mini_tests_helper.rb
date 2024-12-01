module MiniTestsHelper
  def correct_answer_icon(selected_answers, question)
    selected_answers = selected_answers[question.id]
    correct_answers = question.correct_option_numbers
    selected_answers == correct_answers ? '⭕️' : '❌'
  end
end
