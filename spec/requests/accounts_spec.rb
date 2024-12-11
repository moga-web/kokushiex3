require 'rails_helper'

RSpec.describe 'Accounts' do
  let(:user) { create(:user) }
  let(:guest_user) { create(:user, :guest) }

  describe 'GET /show' do
    context 'ゲストユーザーの場合' do
      it 'リダイレクトされる' do
        sign_in guest_user
        get '/account'
        expect(response).to redirect_to(tests_select_path)
      end
    end

    context 'ゲストユーザーではない場合' do
      it 'returns http success' do
        sign_in user
        get '/account'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
