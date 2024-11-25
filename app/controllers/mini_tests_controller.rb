class MiniTestsController < ApplicationController
  def index
    @questions = if params[:search][:tag_ids].present?
                   MiniTestSearchForm.new(params[:search]).search
                 else
                   redirect_to tests_select_path, alert: 'タグを選択してください'
                 end

    @user_responses = []
  end
end
