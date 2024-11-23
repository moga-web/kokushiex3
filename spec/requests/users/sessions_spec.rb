require 'rails_helper'

RSpec.describe 'Users::sessions' do
  describe 'POST /users/sign_in' do
    let(:user) do
      User.create(username: 'testuser', email: 'testuser@example.com', password: 'password',
                  password_confirmation: 'password')
    end
    let(:valid_login_params) { { user: { email: 'testuser@example.com', password: 'password' } } }
    let(:invalid_login_params) { { user: { email: 'testuser@example.com', password: '123456789' } } }

    context '正常系' do
      it 'ログイン後ダッシュボード画面にリダイレクトされる' do
        user
        post user_session_path, params: valid_login_params
        expect(response).to redirect_to(dashboard_path)
        expect(response).to have_http_status(:see_other)
      end
    end

    context '不正なパラメータの場合' do
      it 'ログインができずログイン画面にリダイレクトされる' do
        post user_session_path, params: invalid_login_params
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
