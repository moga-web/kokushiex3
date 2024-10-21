# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content         :string(255)      not null
#  image_url       :string(255)
#  question_number :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  test_session_id :bigint           not null
#
# Indexes
#
#  index_questions_on_test_session_id  (test_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_session_id => test_sessions.id)
#
class Question < ApplicationRecord
  belongs_to :test_session
  has_many :choices, dependent: :destroy

  validates :content, presence: true
  validates :question_number, presence: true

  def correct_choices
    choices.where(is_correct: true)
  end

  # questionに対応する回答を取得する
  def selected_choice(examination)
    user_responses = examination.user_responses.select { |response| response.choice.question_id == id }
    # 回答があれば配列で返し、未回答の場合は空の配列を返す
    user_responses.map(&:choice_id)
    # 本来はchoise_idではなく選択肢の番号1〜5を返したいがこれに該当するカラムがない
  end
end
