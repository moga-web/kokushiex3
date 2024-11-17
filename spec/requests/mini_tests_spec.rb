require 'rails_helper'

RSpec.describe "MiniTests", type: :request do
  describe "GET /index" do
    let(:tag) { create(:tag) }
    let(:question) { create(:question, tags: [tag]) }

    it "returns http success" do
      get mini_tests_path(q: { tag_ids: [tag.id] })
      expect(response).to have_http_status(:success)
    end
  end
end
