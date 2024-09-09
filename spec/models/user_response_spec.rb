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
  describe '#bulk_create_responses' do
    let(:examination) { create(:examination) }
    let(:choice_ids) { create_list(:choice, 3).map(&:id) }

    context 'when all responses are valid' do
      it 'creates all user_responses successfully' do
        expect {
          UserResponse.bulk_create_responses(examination.id, choice_ids)
        }.to change(UserResponse, :count).by(3)
      end
    end

    context 'when one of the responses is invalid' do
      it 'does not create any user_response' do
        invalid_choice_id = nil
        choice_ids_with_invalid = choice_ids + [invalid_choice_id]

        expect {
          UserResponse.bulk_create_responses(examination.id, choice_ids_with_invalid)
        }.not_to change(UserResponse, :count)
      end

      it 'logs an error message' do
        invalid_choice_id = nil
        choice_ids_with_invalid = choice_ids + [invalid_choice_id]

        expect(Rails.logger).to receive(:error).with(/Failed to save UserResponse/)
        UserResponse.bulk_create_responses(examination.id, choice_ids_with_invalid)
      end
    end
  end
end
