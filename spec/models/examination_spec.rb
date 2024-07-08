# == Schema Information
#
# Table name: examinations
#
#  id           :bigint           not null, primary key
#  attempt_date :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  test_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_examinations_on_test_id  (test_id)
#  index_examinations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Examination, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
