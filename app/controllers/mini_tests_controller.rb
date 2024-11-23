class MiniTestsController < ApplicationController
  def index
    # TODO: Formオブジェクト化する
    tag_ids = params[:tag_ids] || []
    # タグに基づいて質問のIDリストを配列で取得
    question_ids = Question.joins(:question_tags)
                           .where(question_tags: { tag_id: tag_ids })
                           .distinct
                           .pluck(:id)
    # ランダムに選択する問題数を指定
    question_count = params[:question_count].to_i
    @questions = Question.random_questions(question_ids, question_count)

    @user_responses = []
  end
end
