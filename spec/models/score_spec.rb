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
require 'rails_helper'

RSpec.describe Score, type: :model do
  describe Score, type: :model do
    let(:test) { create(:test) }
    let(:test_sessions) { create_list(:test_session, 2, test: test) }
    let(:examination) { create(:examination, test: test) }
    let!(:practical_questions) { create_list(:question, 20, test_session: test_sessions.first, question_number: 1) }
    let!(:common_questions) { create_list(:question, 20, test_session: test_sessions.first, question_number: 21) }
    let!(:user_responses) { create_list(:user_response, 10, examination: examination, choice: create(:choice, question: practical_questions.first, is_correct: true)) }
    let(:score) { create(:score, examination: examination) }
  
    describe '#preload_responses' do
      it 'preloads correct user responses with associated choices and questions' do
        correct_responses = score.preload_responses(examination)
    
        # 正しい UserResponse がロードされているか
        expect(correct_responses).to all(be_a(UserResponse))
        expect(correct_responses.size).to eq(10) # 正解のレスポンス数
      end

        it 'consultationのstateが変更されない' do
          expect { consultation.assigned_by!(non_doctor) }.not_to change(consultation, :state)
        end
    end
  end
  
end
