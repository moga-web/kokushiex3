class MiniTestSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :tag_ids, :question_count

  attribute :tag_ids, :integer
  attribute :question_count, :integer

  validates :tag_ids, presence: true
  validates :question_count, presence: true

  def initialize(params)
    @tag_ids = params[:tag_ids] || []
    @question_count = params[:question_count].to_i
  end

  def search
    question_ids = Question.joins(:question_tags)
                           .where(question_tags: { tag_id: @tag_ids })
                           .distinct
                           .pluck(:id)
    Question.random_questions(question_ids, @question_count)
  end
end
