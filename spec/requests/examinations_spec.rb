require 'rails_helper'

RSpec.describe 'Examinations' do
  describe 'GET /examinations/:id' do
    let(:user) { create(:user) }
    let(:test) { create(:test) }
    let(:test_session) { create(:test_session, test:) }
    let(:examination) { create(:examination, test:, user:) }
    let!(:pass_mark) { create(:pass_mark, test:) }
    let!(:score) { create(:score, examination:) }
    let!(:question) { create(:question, test_session:) }
    let!(:choice) { create(:choice, question:) }
    let!(:user_response) { create(:user_response, examination:, choice:) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get examination_path(examination)
      expect(response).to have_http_status(:ok)
    end
  end
end
