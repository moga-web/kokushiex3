class UserResponse < ApplicationRecord
  belongs_to :examination
  belongs_to :choice
end
