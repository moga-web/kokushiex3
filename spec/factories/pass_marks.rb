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
FactoryBot.define do
  factory :pass_mark do
    required_practical_score { rand(0..50) }
    required_score { rand(150..180) }
    total_score { 1 }
  end
end
