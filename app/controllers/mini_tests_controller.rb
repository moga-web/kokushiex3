class MiniTestsController < ApplicationController
  def index
    @q = Test.joins(test_sessions: { questions: :tags }).ransack(params[:q])
    @tests = @q.result.includes(test_sessions: { questions: :tags }).decorate
  end
end
