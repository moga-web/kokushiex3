class Tests::SelectionsController < ApplicationController
  def index
    @tests = Test.all.decorate
    @common_tags = Tag.common_tags
    @special_tags = Tag.special_tags
    @major_categorys = Tag.major_category
  end
end
