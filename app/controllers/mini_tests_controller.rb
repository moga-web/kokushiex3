class MiniTestsController < ApplicationController
  def index
    if params[:search].present? && params[:search][:tag_ids].blank?
      redirect_to tests_select_path, alert: 'タグを選択してください'
    else
      @questions = MiniTestSearchForm.new(params[:search]).search
      @user_responses = []
    end
  end
end
