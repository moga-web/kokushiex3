require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#question_code' do
    let(:test) { create(:test, year: 2023) }
    let(:test_session) { create(:test_session, session: 'AM', test:) }
    let(:question) { create(:question, question_number: 100, test_session:) }

    it '簡略化された回次・セッション・問題番号を返す' do
      expect(question_code(question)).to eq '58A100'
    end
  end
end
