require 'rails_helper'

RSpec.describe "Tests", type: :request do
  describe "GET /show" do
    let(:test) {create(:test)}
    let(:question) {create(:question, test: test)}

    it "returns http success" do
      get test_path(test)
      expect(response).to have_http_status(:success)
    end
  end
end
