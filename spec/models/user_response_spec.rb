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
  # describe '#bulk_create_responses' do
  #   let(:examination) { create(:examination) }
  #   let(:choice_ids) { create_list(:choice, 3).map(&:id) }

  #   context 'when all responses are valid' do
  #     it 'creates all user_responses successfully' do
  #       expect {
  #         UserResponse.bulk_create_responses(examination.id, choice_ids)
  #       }.to change(UserResponse, :count).by(3)
  #     end

  #     it 'creates user_responses with correct attributes' do
  #       UserResponse.bulk_create_responses(examination.id, choice_ids)

  #       choice_ids.each do |choice_id|
  #         user_response = UserResponse.find_by(choice_id: choice_id)
  #         expect(user_response).not_to be_nil
  #         expect(user_response.examination_id).to eq(examination.id)
  #         expect(user_response.choice_id).to eq(choice_id)
  #       end
  #     end
  #   end

  #   context 'when one of the responses is invalid' do
  #     let(:invalid_choice_id) { nil } # 無効な選択肢ID

  #     it 'does not create any user_response when one response is invalid' do
  #       choice_ids_with_invalid = choice_ids + [invalid_choice_id]

  #       expect {
  #         UserResponse.bulk_create_responses(examination.id, choice_ids_with_invalid)
  #       }.not_to change(UserResponse, :count) # 何も作成されないことを確認
  #     end

  #     it 'logs an error message for the invalid response' do
  #       choice_ids_with_invalid = choice_ids + [invalid_choice_id]

  #       expect(Rails.logger).to receive(:error).with(/Failed to save UserResponse:/).once
  #       UserResponse.bulk_create_responses(examination.id, choice_ids_with_invalid)
  #     end
  #   end
  # end
end
