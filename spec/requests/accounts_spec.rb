require 'rails_helper'

RSpec.describe 'Accounts' do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/account'
      expect(response).to have_http_status(:success)
    end
  end
end
