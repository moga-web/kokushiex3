require 'rails_helper'

RSpec.describe 'UserResponses', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:test) { create(:test) }
    let(:choices) { create_list(:choice, 5) } # choice_ids に基づいて5つの選択肢を生成

    let(:params) do
      {
        test_id: test.id,
        user_response: {
          choice_ids: choices.map(&:id) # choice_idsに基づいて作成したchoicesのIDを配列に
        },
      }
    end

    before do
      sign_in user
    end

    it 'creates a new user response and returns http success' do
      post user_responses_path, params: params
      expect(response).to have_http_status(:found)
    end
  end
end

