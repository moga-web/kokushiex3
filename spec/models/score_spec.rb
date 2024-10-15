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
    let(:test_session) { create(:test_session, test:) }
    let(:examination) { create(:examination, test:) }
    
    let(:score) { create(:score, examination:) }
  
    describe '#calculate_practical_score' do
      let(:practical_question) { create(:question, test_session: , question_number: (1..20).to_a.sample) }
      let(:choice){ create(:choice, question: practical_question, is_correct: true) }
      let!(:user_responses) { create_list(:user_response, 10, examination:, choice:) }

      it 'practical scoreが1問3点として計算される' do
        correct_responses = examination.user_responses.correct_responses.to_a
        expect(score.calculate_practical_score(correct_responses)).to eq(30)
      end
    end

    describe '#calculate_common_score' do
      let(:common_question) { create(:question, test_session: , question_number: (21..100).to_a.sample) }
      let(:choice){ create(:choice, question: common_question, is_correct: true) }
      let!(:user_responses) { create_list(:user_response, 10, examination:, choice:) }

      it 'common scoreが1問1点として計算される' do
        correct_responses = examination.user_responses.correct_responses.to_a
        expect(score.calculate_common_score(correct_responses)).to eq(10)
      end
    end

    describe '#calculate_scores' do
      let!(:practical_questions) { create_list(:question, 10, test_session: test_session, question_number: (1..20).to_a.sample) }
      let!(:common_questions) { create_list(:question, 20, test_session: test_session, question_number: (21..40).to_a.sample) }

      let(:practical_choice) { create(:choice, question: practical_questions.first, is_correct: true) }
      let(:common_choice) { create(:choice, question: common_questions.first, is_correct: true) }

      let!(:practical_responses) { create_list(:user_response, 10, examination:, choice: practical_choice) }
      let!(:common_responses) { create_list(:user_response, 20, examination:, choice: common_choice) }
      
      it 'scoreが正しく計算される' do
        expect do
          score.calculate_scores(examination)
          expect(score.total_score).to eq(50)
          expect(score.practical_score).to eq(30)
          expect(score.common_score).to eq(20)
        end.to change(Score, :count).by(1)
      end
    end
  end
end
