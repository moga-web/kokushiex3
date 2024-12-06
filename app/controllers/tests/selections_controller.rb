class Tests::SelectionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tests = Test.all.decorate
    @common_tags = Tag.common_tags
    @special_tags = Tag.special_tags
    @major_categories = Tag.major_categories
  end
end
