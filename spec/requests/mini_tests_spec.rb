require 'rails_helper'

RSpec.describe "MiniTests", type: :request do
  describe "GET /index" do
    let(:test){create(:test)}
    let(:test_session) {create(:test_session, test: test)}
    let(:tag) {create(:tag)}
    let!(:question) {create(:question, test_session: test_session)}
    let!(:question_tag) { create(:question_tag, question: question, tag: tag) }
    

    it "returns http success" do
      get "/mini_tests", params: { tag_ids: [tag.id] }
      expect(response).to have_http_status(:success)
    end
  end
end
