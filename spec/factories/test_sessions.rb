FactoryBot.define do
  factory :test_session do
    association :test
    session { %w[AM PM].sample }  # AMまたはPMをランダムに選択
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
