# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  pass_mark  :integer          not null
#  session    :string(255)      not null
#  year       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :test do
    year { "MyString" }
    session { "MyString" }
    pass_mark { 1 }
    created_at { "2024-07-01 11:11:20" }
    updated_at { "2024-07-01 11:11:20" }
  end
end
