class ScoreCalculationJob < ApplicationJob
  queue_as :default

  def perform(examination_id)
    examination = Examination.find(examination_id)
    scores = { total: 0, common: 0, practical: 0 }
    # 各TestSessionで実地スコアと共通スコアを計算
    examination.test.test_sessions.each do |test_session|
      # 問題を取得
      sorted_questions = sort_questions(test_session)
      # スコアを計算
      scores[:practical] += calculate_practical_score(examination, sorted_questions[:practical_questions])
      scores[:common] += calculate_common_score(examination, sorted_questions[:common_questions])
    end
    # 合計スコア = 実地スコア + 共通スコア
    scores[:total] = scores[:practical] + scores[:common]
    # 計算されたスコアを ScoresControllerに渡す
    ScoresController.new.create(examination_id, scores)
  end

  private

  # 実地問題と共通問題を分ける
  def sort_questions(test_session)
    {
      practical_questions: test_session.questions.order(:question_number).limit(20),
      common_questions: test_session.questions.order(question_number: :desc).limit(20)
    }
  end

  # 実地スコアの計算 (1問3点)
  def calculate_practical_score(examination, practical_questions)
    examination.user_responses.joins(:choice).where(choices: { is_correct: true }, question: practical_questions).count * 3
  end

  # 共通スコアの計算 (1問1点)
  def calculate_common_score(examination, common_questions)
    examination.user_responses.joins(:choice).where(choices: { is_correct: true }, question: common_questions).count * 1
  end
end
