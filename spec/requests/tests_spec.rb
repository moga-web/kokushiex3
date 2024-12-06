require 'rails_helper'

RSpec.describe 'Tests' do
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe 'GET /tests/:id' do
    let(:test) { create(:test) }
    let(:test_session) { create(:test_session, test:) }
    let!(:question) { create(:question, test_session:) }

    it 'returns http success' do
      get test_path(test)
      expect(response).to have_http_status(:success)
    end
  end
end
