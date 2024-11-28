class MiniTestSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :tag_ids, default: []
  attribute :question_count, :integer, default: 10

  validates :tag_ids, presence: { message: 'タグを選択してください' }
  validates :question_count, presence: true

  def search
    question_ids = Question.joins(:question_tags)
                           .where(question_tags: { tag_id: tag_ids })
                           .distinct
                           .pluck(:id)
    Question.random_questions(question_ids, question_count)
  end
end
