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

RSpec.describe Score do
  describe Score::ScoreCalculator, type: :class do
    let(:test) { create(:test) }
    let(:test_session) { create(:test_session, test:) }
    let(:examination) { create(:examination, test:) }
    let(:score) { create(:score, examination:) }
    let(:score_calculator) { described_class.new(examination) }

    describe '#practical_score' do
      let(:practical_question) { create(:question, test_session:, question_number: (1..20).to_a.sample) }
      let(:choice) { create(:choice, question: practical_question, is_correct: true) }
      let!(:user_responses) { create_list(:user_response, 10, examination:, choice:) }

      before do
        score_calculator.correct_responses
      end

      it 'practical scoreが1問3点として計算される' do
        expect(score_calculator.practical_score).to eq(30)
      end
    end

    describe '#common_score' do
      let(:common_question) { create(:question, test_session:, question_number: (21..100).to_a.sample) }
      let(:choice) { create(:choice, question: common_question, is_correct: true) }
      let!(:user_responses) { create_list(:user_response, 10, examination:, choice:) }

      before do
        score_calculator.correct_responses
      end

      it 'common scoreが1問1点として計算される' do
        expect(score_calculator.common_score).to eq(10)
      end
    end

    describe '#total_score' do
      let(:common_question) { create(:question, test_session:, question_number: (21..100).to_a.sample) }
      let(:practical_question) { create(:question, test_session:, question_number: (1..20).to_a.sample) }
      let(:practical_choice) { create(:choice, question: practical_question, is_correct: true) }
      let(:common_choice) { create(:choice, question: common_question, is_correct: true) }
      let!(:common_responses) { create_list(:user_response, 10, examination:, choice: common_choice) }
      let!(:practical_responses) { create_list(:user_response, 10, examination:, choice: practical_choice) }

      before do
        score_calculator.correct_responses
        score_calculator.practical_score
        score_calculator.common_score
      end

      it 'total_scoreが計算される' do
        expect(score_calculator.total_score).to eq(40)
      end
    end

    describe '#call' do
      let(:common_question) { create(:question, test_session:, question_number: (21..100).to_a.sample) }
      let(:practical_question) { create(:question, test_session:, question_number: (1..20).to_a.sample) }
      let(:practical_choice) { create(:choice, question: practical_question, is_correct: true) }
      let(:common_choice) { create(:choice, question: common_question, is_correct: true) }
      let!(:common_responses) { create_list(:user_response, 20, examination:, choice: common_choice) } # rubocop:disable FactoryBot/ExcessiveCreateList
      let!(:practical_responses) { create_list(:user_response, 10, examination:, choice: practical_choice) }

      before do
        score_calculator.correct_responses
      end

      it 'scoreが1件作成される' do
        expect { score_calculator.call }.to change(Score, :count).by(1)
      end
    end
  end
end
