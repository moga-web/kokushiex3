# == Schema Information
#
# Table name: pass_marks
#
#  id                       :bigint           not null, primary key
#  required_practical_score :integer          not null
#  required_score           :integer          not null
#  total_score              :integer          not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  test_id                  :bigint           not null
#
# Indexes
#
#  index_pass_marks_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
require 'rails_helper'

RSpec.describe PassMark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
