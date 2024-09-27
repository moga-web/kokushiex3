require 'rails_helper'

RSpec.describe 'UserResponses', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:test) { create(:test) }
    let(:examination) { create(:examination, user: user, test: test) }
    let(:choices) { create_list(:choice, 5) } # choice_ids に基づいて5つの選択肢を生成

    let(:params) do
      {
        test_id: test.id,
        user_response: {
          choice_ids: choices.map(&:id) # choice_idsに基づいて作成したchoicesのIDを配列に
        },
        examination_id: examination.id
      }
    end

    before do
      sign_in user
      ActiveJob::Base.queue_adapter = :test
    end

    it 'user_responseが作成されリダイレクトされる' do
      expect { post user_responses_path, params: params }.to change(UserResponse, :count).by(5)
      expect(response).to have_http_status(:found)
    end

    it 'enqueue job' do
      expect {
        ScoreCalculationJob.perform_later(examination.id)
      }.to have_enqueued_job.with(examination.id)
    end
  end
end

