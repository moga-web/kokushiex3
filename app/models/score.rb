# == Schema Information
#
# Table name: scores
#
#  id              :bigint           not null, primary key
#  common_score    :integer          not null
#  practical_score :integer          not null
#  total_score     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  examination_id  :bigint           not null
#
# Indexes
#
#  index_scores_on_examination_id  (examination_id)
#
# Foreign Keys
#
#  fk_rails_...  (examination_id => examinations.id)
#
class Score < ApplicationRecord
  belongs_to :examination

  validates :total_score, presence: true
  validates :common_score, presence: true
  validates :practical_score, presence: true

  def calculate_scores(examination)
    scores = { total: 0, common: 0, practical: 0 }
    examination.test.test_sessions.each do |test_session|
      sorted_questions = Question.sort_questions(test_session)
      scores[:practical] += calculate_practical_score(examination, sorted_questions[:practical_questions])
      scores[:common] += calculate_common_score(examination, sorted_questions[:common_questions])
    end
    scores[:total] = scores[:practical] + scores[:common]
    self.total_score = scores[:total]
    self.common_score = scores[:common]
    self.practical_score = scores[:practical]

    save
  end

  # 実地スコアの計算 (1問3点)
  def calculate_practical_score(examination, practical_questions)
    practical_question_ids = practical_questions.pluck(:id)
    examination.user_responses.includes(choice: :question).where(choices: { is_correct: true },
                                                                 questions: { id: practical_question_ids }).count * 3
  end

  # 共通スコアの計算 (1問1点)
  def calculate_common_score(examination, common_questions)
    common_question_ids = common_questions.pluck(:id)
    examination.user_responses.includes(choice: :question).where(choices: { is_correct: true },
                                                                 questions: { id: common_question_ids }).count * 1
  end
end
