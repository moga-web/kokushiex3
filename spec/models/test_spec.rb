# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  year       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Test, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
