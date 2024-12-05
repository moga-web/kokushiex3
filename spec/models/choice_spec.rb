require 'rails_helper'

RSpec.describe Choice do
  describe '.mini_test_answers' do
    subject { described_class.mini_test_answers(choice_ids) }

    let(:first_question) { create(:question) }
    let(:second_question) { create(:question) }
    let(:first_choice) { create(:choice, question: first_question) }
    let(:second_choice) { create(:choice, question: second_question) }

    context '有効な choice_ids が提供された場合' do
      let!(:choice_ids) { [first_choice.id, second_choice.id] }

      it '質問ごとに正しい選択肢の番号を返す' do
        result = {
          first_question.id => [first_choice.option_number],
          second_question.id => [second_choice.option_number]
        }
        expect(subject).to eq(result)
      end
    end

    context 'choice_ids が空の場合' do
      let(:choice_ids) { [] }

      it '空のハッシュを返す' do
        expect(subject).to eq({})
      end
    end
  end
end
