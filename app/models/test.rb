# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  year       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Test < ApplicationRecord
  has_many :test_sessions, dependent: :destroy
  has_one :pass_mark, dependent: :destroy
  has_many :examinations, through: :test_sessions, dependent: :destroy

  validates :year, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id year]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[test_sessions questions tags]
  end
end
