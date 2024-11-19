class Tests::SelectionsController < ApplicationController
  def index
    @tests = Test.all.decorate
    @common_tags = Tag.common_tags
    @special_tags = Tag.special_tags
    @major_categorys = Tag.major_category

    @questions = if params[:tag_ids].present?
                   tag_ids = params[:tag_ids]
                   Question.joins(:question_tags)
                           .where(question_tags: { tag_id: tag_ids })
                           .distinct
                 else
                   Question.all
                 end
  end
end
