require 'rails_helper'

RSpec.describe 'Dashboards' do
  describe 'GET /index' do
    let(:user) { create(:user) }
    let(:test) { create(:test) }
    let!(:pass_mark) { create(:pass_mark, test:) }
    let!(:examination) { create(:examination, test:, user:) }
    let!(:score) { create(:score, examination:) }

    before do
      sign_in user
    end

    it 'returns http success' do
      get '/dashboard'
      expect(response).to have_http_status(:success)
    end
  end
end
