class MiniTestsController < ApplicationController
  def index
    @q = Test.ransack(params[:q])
    @tests = @q.result.includes(:tags).decorate
  end
end
