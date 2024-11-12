FactoryBot.define do
  factory :question_tag do
    question { association(:question) }
    tag { association(:tag) }
  end
end
