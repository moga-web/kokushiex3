module ApplicationHelper
  def question_code(question)
    turn = question.test_session.test.year.to_i - 1965
    abbreviated_session = question.test_session.session == 'AM' ? 'A' : 'P'
    "#{turn}#{abbreviated_session}#{question.question_number}"
  end
end
