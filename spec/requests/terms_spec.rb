require 'rails_helper'

RSpec.describe 'Terms' do
  describe 'GET /terms_of_use' do
    it 'returns http success' do
      get terms_of_use_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /privacy_policy' do
    it 'returns http success' do
      get privacy_policy_path
      expect(response).to have_http_status(:success)
    end
  end
end
