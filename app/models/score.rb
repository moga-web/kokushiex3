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

  class ScoreCalculator
    def initialize(examination)
      @examination = examination
    end

    def call
      correct_responses

      Score.create!(
        examination_id: @examination.id,
        common_score:,
        practical_score:,
        total_score:
      )
    end

    def total_score
      common_score + practical_score
    end

    # 実地スコアの計算 (1問3点)
    def practical_score
      @practical_score ||= @correct_responses.count { |response| response.choice.question.question_number <= 20 } * 3
    end

    # 共通スコアの計算 (1問1点)
    def common_score
      @common_score ||= @correct_responses.count { |response| response.choice.question.question_number > 20 } * 1
    end

    def correct_responses
      @correct_responses ||= @examination.user_responses.correct_responses.to_a
    end
  end
end
