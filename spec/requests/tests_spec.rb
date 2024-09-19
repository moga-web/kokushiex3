require 'rails_helper'

RSpec.describe "Tests", type: :request do
  describe "GET /tests/:id" do
    let(:test){create(:test)}
    let(:test_session) {create(:test_session, test: test)}
    let!(:question) {create(:question, test_session: test_session)}

    it "returns http success" do
      get test_path(test)
      expect(response).to have_http_status(:success)
    end
  end
end
