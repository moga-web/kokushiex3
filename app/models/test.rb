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
class Test < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :pass_mark, presence: true
  validates :session, presence: true, inclusion: { in: %w[AM PM] }
  validates :year, presence: true
end