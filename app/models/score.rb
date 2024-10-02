# == Schema Information
#
# Table name: scores
#
#  id              :bigint           not null, primary key
#  common_score    :integer          not null
#  practical_score :integer          not null
#  total_score     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  examination_id  :bigint           not null
#
# Indexes
#
#  index_scores_on_examination_id  (examination_id)
#
# Foreign Keys
#
#  fk_rails_...  (examination_id => examinations.id)
#
class Score < ApplicationRecord
  belongs_to :examination

  validates :total_score, presence: true
  validates :common_score, presence: true
  validates :practical_score, presence: true
end
