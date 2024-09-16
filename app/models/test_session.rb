class TestSession < ApplicationRecord
  belongs_to :test
  has_many :examinations, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :session, presence: true, inclusion: { in: %w[AM PM] }
end
