class Tests::SelectionsController < ApplicationController
  def index
    @q = Test.joins(test_sessions: { questions: :tags }).ransack(params[:q])
    @tests = @q.result.includes(test_sessions: { questions: :tags }).decorate
    @major_categorys = Tag.major_category.all
    @common_tags = Tag.common_tags.all
    @special_tags = Tag.special_tags.all
  end
end
