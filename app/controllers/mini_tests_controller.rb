class MiniTestsController < ApplicationController
  def index
    tag_ids = params[:q][:tag_ids]
    @questions = Question.joins(:tags).where(tags: { id: tag_ids }).decorate

    # 解答を保持するためにuser_responseを持たせたいが、初回にエラーが出ないように空配列を渡す
    @user_responses = []
  end
end
