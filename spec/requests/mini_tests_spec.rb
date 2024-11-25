require 'rails_helper'

RSpec.describe 'MiniTests' do
  describe 'GET /index' do
    let(:test) { create(:test) }
    let(:test_session) { create(:test_session, test:) }
    let(:tag) { create(:tag) }
    let!(:question) { create(:question, test_session:) }
    let!(:question_tag) { create(:question_tag, question:, tag:) }
    let(:params) do
      {
        search: {
          tag_ids: [tag.id],
          question_count: 10
        }
      }
    end

    it 'returns http success' do
      get('/mini_tests', params:)
      expect(response).to have_http_status(:success)
    end
  end
end
