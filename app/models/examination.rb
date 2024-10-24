# == Schema Information
#
# Table name: examinations
#
#  id           :bigint           not null, primary key
#  attempt_date :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  test_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_examinations_on_test_id  (test_id)
#  index_examinations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
class Examination < ApplicationRecord
  class InvalidChoiceError < StandardError; end

  belongs_to :user
  belongs_to :test

  has_many :user_responses, dependent: :destroy
  has_one :score, dependent: :destroy

  def self.create_result!(user_id:, test_id:, attempt_date:, choice_ids:)
    examination = Examination.create!(user_id:, test_id:, attempt_date:)

    choices = Choice.where(id: choice_ids)
    if choices.size != choice_ids.size
      missing_ids = choice_ids - choices.pluck(:id)
      Rails.logger.error "Missing Choice IDs: #{missing_ids.join(', ')}"
      raise InvalidChoiceError, '不正な選択肢が含まれています'
    end

    attributes = choice_ids.map do |choice_id|
      {
        examination_id: examination.id,
        choice_id:,
      } # rails7系からはcreated_at, updated_atは自動で設定される
    end
    # insert_all!を使って一括挿入
    UserResponse.insert_all!(attributes)

    # スコア計算
    Score::ScoreCalculator.new(examination).call
  end
end
