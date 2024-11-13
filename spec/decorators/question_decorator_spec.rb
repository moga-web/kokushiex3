require 'rails_helper'

RSpec.describe QuestionDecorator do
  describe '#result_color(examination)' do
    let(:examination) { create(:examination) }
    let(:question) { create(:question).decorate }

    context '未回答の場合' do
      it '赤色を返す' do
        allow(question).to receive(:selected_option_numbers).with(examination).and_return([])
        expect(question.result_color(examination)).to eq 'text-red-300'
      end
    end

    context '回答がある場合' do
      it '回答が正解の場合はtext-gray-800を返す' do
        allow(question).to receive(:selected_option_numbers).with(examination).and_return([1, 2])
        allow(question).to receive(:correct_option_numbers).and_return([1, 2])
        expect(question.result_color(examination)).to eq 'text-gray-800'
      end

      it '回答が不正解の場合は赤色を返す' do
        allow(question).to receive(:selected_option_numbers).with(examination).and_return([1, 3])
        allow(question).to receive(:correct_option_numbers).and_return([1, 2])
        expect(question.result_color(examination)).to eq 'text-red-300'
      end
    end
  end

  describe '#implementation_year' do
    let(:test){ create(:test, year:2023) }

    it '回次と実施年度を返す' do
      expect(test.decorate.implementation_year).to eq '第58回(2023年度)'
    end
  end
  
  describe '#question_code' do
    let(:test){ create(:test, year:2023) }
    let(:test_session){ create(:test_session, session: 'AM', test: ) }
    let(:question){ create(:question, question_number: 100, test_session:)}

    it '簡略化された回次・セッション・問題番号を返す' do
      expect(test.decorate.question_code(question)).to eq '58A100'
    end
  end

  describe '#question_code_without_turn' do
    let(:test){ create(:test, year:2023) }
    let(:test_session){ create(:test_session, session: 'AM', test: ) }
    let(:question){ create(:question, question_number: 100, test_session:)}

    it 'セッション・問題番号を返す' do
      expect(test.decorate.question_code_without_turn(question)).to eq 'A100'
    end
  end
end
