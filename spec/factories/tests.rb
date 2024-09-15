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
  factory :test do
    year { rand(2014..2024) }
    session { %w[AM PM].sample }
    pass_mark { rand(150..200) }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
