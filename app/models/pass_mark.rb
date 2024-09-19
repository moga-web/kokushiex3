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
class PassMark < ApplicationRecord
  belongs_to :test

  validates :required_score, presence: true
  validates :required_practical_score, presence: true
  validates :total_score, presence: true
end
