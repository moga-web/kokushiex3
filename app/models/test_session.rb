class TestSession < ApplicationRecord
  belongs_to :test  # Testとの関連を定義
  has_many :examinations, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :session, presence: true, inclusion: { in: %w[AM PM] }
end
