require 'rails_helper'

RSpec.describe "Tests::Selections", type: :request do
  describe "GET /index" do
    it 'returns http success' do
      get '/select'
      expect(response).to have_http_status(:success)
    end
  end

end
