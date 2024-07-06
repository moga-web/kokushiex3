# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content         :string(255)      not null
#  image_url       :string(255)
#  question_number :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  test_id         :bigint           not null
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
FactoryBot.define do
  factory :question do
    test { nil }
    question_number { rand(1..100) }
    content { Faker::Lorem.sentence }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
