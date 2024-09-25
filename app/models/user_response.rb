# == Schema Information
#
# Table name: user_responses
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  choice_id      :bigint           not null
#  examination_id :bigint           not null
#
# Indexes
#
#  index_user_responses_on_choice_id       (choice_id)
#  index_user_responses_on_examination_id  (examination_id)
#
# Foreign Keys
#
#  fk_rails_...  (choice_id => choices.id)
#  fk_rails_...  (examination_id => examinations.id)
#
class UserResponse < ApplicationRecord
  belongs_to :examination
  belongs_to :choice

  # insert_allではバリデーションチェックができないためメソッド化
  def self.bulk_create_responses(examination_id, choice_ids)
    # バリデーションチェックのためダミーレコードを生成
    attributes = choice_ids.map do |choice_id|
      user_response = new(examination_id:, choice_id:)
      if user_response.valid?
        # 一括挿入用のハッシュを作成
        { examination_id:, choice_id:, created_at: Time.current, updated_at: Time.current }
      else
        # 現状では1つでもエラーが発生すると1つもcreateされない
        Rails.logger.error "Failed to save UserResponse: #{user_response.errors.full_messages.join(', ')}"
        return false
      end
    end
    # insert_allを使って一括挿入
    UserResponse.insert_all(attributes) # rubocop:disable Rails/SkipsModelValidations
  end

  private

  def enqueue_score_calculation
    ScoreCalculationJob.perform_later(self.examination_id)
  end
end
