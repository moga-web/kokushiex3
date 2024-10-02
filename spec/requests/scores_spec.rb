require 'rails_helper'

RSpec.describe "Scores", type: :request do
  describe "POST /examinations/:examination_id/scores" do
    let(:user) { create(:user) }
    let(:examination) { create(:examination) }
    let(:score_params) do
      {
        total: 300,
        common: 120,
        practical: 180
      }
    end

    before do
      sign_in user
    end

    it 'creates a new score and returns http success' do
      post examination_scores_path(examination.id), params: { scores: score_params }
      expect(response).to have_http_status(:success)
    end
  end
end
