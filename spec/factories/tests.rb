# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  year       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  year { rand(2014..2024) }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
    
    # 関連するtest_sessionsも同時に作成
    after(:create) do |test|
      create(:test_session, test: test)
end
