class TestDecorator < Draper::Decorator
  delegate_all

  def question_code(question)
    implementation_year = object.year.to_i - 1965
    abbreviated_session = object.session == 'AM' ? 'A' : 'P'
    "#{implementation_year}#{abbreviated_session}#{question.question_number}"
  end
end
