class MiniTestsController < ApplicationController
  def index
    # 問題数も選択できるようにする
    # 　必要なメソッドはモデルに移す
    @questions = if params[:tag_ids].present?
                   tag_ids = params[:tag_ids]
                   Question.joins(:question_tags)
                           .where(question_tags: { tag_id: tag_ids })
                           .distinct
                 end
    @user_responses = []
  end
end
