require 'rails_helper'

RSpec.describe 'MiniTests' do
  describe 'GET /index' do
    let(:test) { create(:test) }
    let(:test_session) { create(:test_session, test:) }
    let(:tag) { create(:tag) }
    let!(:question) { create(:question, test_session:) }
    let!(:question_tag) { create(:question_tag, question:, tag:) }

    context 'タグを指定している場合' do
      let(:params) do
        {
          search: {
            tag_ids: [tag.id],
            question_count: 10
          }
        }
      end

      it 'returns http success' do
        get('/mini_tests', params:)
        expect(response).to have_http_status(:success)
      end
    end

    context 'タグを指定していない場合' do
      let(:params) do
        {
          search: {
            tag_ids: nil,
            question_count: 10
          }
        }
      end

      it 'test/selectにリダイレクトする' do
        get('/mini_tests', params:)
        expect(response).to redirect_to(tests_select_path)
      end
    end
  end
end
