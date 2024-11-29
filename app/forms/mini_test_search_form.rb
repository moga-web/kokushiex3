class MiniTestSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :tag_ids, :question_count

  validates :tag_ids, presence: { message: 'タグを選択してください' }
  validates :question_count, presence: true

  def initialize(params = {})
    @tag_ids = params.dig(:search, :tag_ids) || []
    @question_count = params.dig(:search, :question_count).to_i
  end

  def search
    question_ids = Question.joins(:question_tags)
                           .where(question_tags: { tag_id: tag_ids })
                           .distinct
                           .pluck(:id)
    Question.random_questions(question_ids, question_count)
  end
end
