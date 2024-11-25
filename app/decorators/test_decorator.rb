class TestDecorator < Draper::Decorator
  delegate_all

  def question_code_without_turn(question)
    abbreviated_session = question.test_session.session == 'AM' ? 'A' : 'P'
    "#{abbreviated_session}#{question.question_number}"
  end

  def turn
    object.year.to_i - 1965
  end

  def implementation_year
    "第#{turn}回(#{object.year}年度)"
  end
end
