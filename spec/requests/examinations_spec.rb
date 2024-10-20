require 'rails_helper'

RSpec.describe "Examinations", type: :request do
  describe "GET /examinations/:id" do
    let(:test){create(:test)}
    let(:test_session) { create(:test_session, test:) }
    let(:examination) { create(:examination, test:) }
    let!(:pass_mark){ create(:pass_mark, test:)}
    let!(:score) { create(:score, examination:) }
    let!(:question){ create(:question, test_session:) }
    let!(:choice) { create(:choice, question:) }
    let!(:user_response) { create(:user_response, examination:, choice:) }

    it "returns http success" do
      get examination_path(examination)
      expect(response).to have_http_status(200)
    end
  end
end
