require 'rails_helper'

RSpec.describe "Examinations", type: :request do
  describe "GET /examinations/:id" do
    it "returns http success" do
      get examination_path
      expect(response).to have_http_status(200)
    end
  end
end
