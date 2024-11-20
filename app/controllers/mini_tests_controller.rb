class MiniTestsController < ApplicationController
  def index
    tag_ids = params[:tag_ids] || []
    # タグに基づいて質問を取得
    @questions = Question.joins(:question_tags)
                         .where(question_tags: { tag_id: tag_ids })
                         .distinct

    # 質問のIDリストを取得
    question_ids = @questions.pluck(:id) # IDの配列を取得

    # ランダムに選択する問題数を取得
    question_count = params[:question_count].to_i

    # ランダムに指定された数のIDを選択
    random_ids = question_ids.sample(question_count)
    @questions = @questions.where(id: random_ids) # 選択したIDに基づいて質問をフィルタリング

    @user_responses = []
  end
end
