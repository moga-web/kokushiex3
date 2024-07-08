# == Schema Information
#
# Table name: user_responses
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  choice_id      :bigint           not null
#  examination_id :bigint           not null
#
# Indexes
#
#  index_user_responses_on_choice_id       (choice_id)
#  index_user_responses_on_examination_id  (examination_id)
#
# Foreign Keys
#
#  fk_rails_...  (choice_id => choices.id)
#  fk_rails_...  (examination_id => examinations.id)
#
require 'rails_helper'

RSpec.describe UserResponse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
