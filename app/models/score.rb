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
    scores = { total_score: 0, common_score: 0, practical_score: 0 }
    correct_responses = examination.user_responses.correct_responses.to_a
    # 配点ごとにスコアを計算
    scores[:practical_score] += calculate_practical_score(correct_responses)
    scores[:common_score] += calculate_common_score(correct_responses)
    scores[:total_score] = scores[:practical_score] + scores[:common_score]

    update!(
      total_score: scores[:total_score],
      common_score: scores[:common_score],
      practical_score: scores[:practical_score]
    )
  end

  # 実地スコアの計算 (1問3点)
  def calculate_practical_score(correct_responses)
    correct_responses.count { |response| response.choice.question.question_number <= 20 } * 3
  end

  # 共通スコアの計算 (1問1点)
  def calculate_common_score(correct_responses)
    correct_responses.count { |response| response.choice.question.question_number > 20 } * 1
  end
end
