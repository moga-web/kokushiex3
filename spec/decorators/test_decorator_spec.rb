require 'rails_helper'

RSpec.describe TestDecorator do
  describe '#turn' do
    let(:test){ create(:test, year:2023) }

    it '回次を返す' do
      expect(test.decorate.turn).to eq 58
    end
  end

  describe '#implementation_year' do
    let(:test){ create(:test, year:2023) }

    it '回次と実施年度を返す' do
      expect(test.decorate.implementation_year).to eq '第58回(2023年度)'
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
