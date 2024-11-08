require 'rails_helper'

RSpec.describe 'UserResponses', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:test) { create(:test) }
    let(:choice_ids) { create_list(:choice, 3).map(&:id) }
    let(:params) do
      {
        test_id: test.id,
        user_response: {
          choice_ids: choice_ids(&:to_s)
        }
      }
    end

    before do
      sign_in user
    end

    context '正常系' do
      before do
        allow(Examination).to receive(:create_result!)
      end

      it 'user_responseが作成されリダイレクトされる' do
        post user_responses_path, params: params
        expect(response).to redirect_to(dashboard_path)
        expect(flash[:notice]).to eq '試験結果を保存しました'
      end
    end

    context '異常系' do
      before do
        allow(Examination).to receive(:create_result!).and_raise(StandardError)
      end

      it 'newテンプレートがレンダリングされ、エラーメッセージが表示される' do
        post user_responses_path, params: params
        expect(response).to redirect_to(test_path(params[:test_id]))
        expect(flash[:alert]).to eq '試験結果を保存できませんでした'
      end
    end
  end
end

