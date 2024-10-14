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

  def self.sort_questions(test_session)
    practical_questions = test_session.questions.order(:question_number).limit(20).pluck(:id)
    common_questions = test_session.questions.where.not(id: practical_questions).pluck(:id)
    { practical_questions:, common_questions: }
  end
end
