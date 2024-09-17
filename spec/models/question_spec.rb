# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content         :string(255)      not null
#  image_url       :string(255)
#  question_number :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  test_session_id :bigint           not null
#
# Indexes
#
#  index_questions_on_test_session_id  (test_session_id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
