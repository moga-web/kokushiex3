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
# Foreign Keys
#
#  fk_rails_...  (test_session_id => test_sessions.id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }

  describe '#correct_choices' do
    let(:correct_choice){ create(:choice, question: , is_correct: true) }
    let(:incorrect_choice){ create(:choice, question: , is_correct: false) }

    it '正解の選択肢のみ配列で返される' do
      expect(question.correct_choices).to eq([correct_choice])
    end
  end

  describe '#selected_choice' do
    let(:examination) { create(:examination) }

    context 'questionに紐づくユーザーの回答がある場合' do
      let(:first_choice) { create(:choice, question: ) }
      let(:second_choice) { create(:choice, question: ) }
      let!(:user_response1) { create(:user_response, examination: , choice: first_choice) }
      let!(:user_response2) { create(:user_response, examination: , choice: second_choice) }

      it '回答（choice_id）が配列で返される' do
        expect(question.selected_choice(examination)).to eq([first_choice.id, second_choice.id])
      end
    end
  
    context 'questionに紐づく回答がない場合' do
      let(:other_question){ create(:question) }
      let(:other_choice) { create(:choice, question: other_question) }
      let(:other_response){ create(:user_response, examination:, choice: other_choice) }

      it '空の配列が返される' do
        expect(other_question.selected_choice(examination)).to eq([])
      end
    end
  end
end
