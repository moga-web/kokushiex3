# == Schema Information
#
# Table name: choices
#
#  id          :bigint           not null, primary key
#  content     :string(255)      not null
#  is_correct  :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :choice do
    association :question
    content { Faker::Lorem.sentence(word_count: 1) }
    is_correct { Faker::Boolean.boolean }  # ランダムなtrue/falseを生成
  end
end
