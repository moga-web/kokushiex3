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
  def self.bulk_create_responses(examination_id, choice_ids) # rubocop:disable Metrics/MethodLength
    # 事前に全ての Choiceを一括で取得
    choices = Choice.where(id: choice_ids)
    # 不正なchoice_idが含まれている場合はエラーを返す
    if choices.size != choice_ids.size
      missing_ids = choice_ids - choices.pluck(:id)
      Rails.logger.error "Missing Choice IDs: #{missing_ids.join(', ')}"
      return false
    end
    # 一括挿入用のハッシュを作成
    attributes = choice_ids.map do |choice_id|
      {
        examination_id:,
        choice_id:,
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    # insert_allを使って一括挿入
    UserResponse.insert_all(attributes) # rubocop:disable Rails/SkipsModelValidations
  end
end
