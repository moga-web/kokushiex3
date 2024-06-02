require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_up" do
    it "ユーザー登録画面が表示される" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users/sign_up" do
    context '正常系' do
      it 'ユーザー登録後ダッシュボード画面にリダイレクトされる' do
        user_params = { user: { username: 'newuser', email: 'newuser@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(dashboard_path)
        expect(response).to have_http_status(:see_other)#Rails7では、POSTリクエスト後のリダイレクトは303
      end
    end

    context '不正なパラメータの場合' do
      it 'ユーザー登録ができず新規登録画面にリダイレクトされる' do
        user_params = { user: { username: '', email: 'user@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.not_to change(User, :count)
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /users/sign_in" do
    context '正常系' do
      it 'ログイン後ダッシュボード画面にリダイレクトされる' do
        user = User.create(username: 'testuser', email: 'testuser@example.com', password: 'password', password_confirmation: 'password')
        user_params = { user: { email: 'testuser@example.com', password: 'password' } }
        post user_session_path, params: user_params
        expect(response).to redirect_to(dashboard_path)
        expect(response).to have_http_status(:see_other)
      end
    end

    context '不正なパラメータの場合' do
      it 'ログインができずログイン画面にリダイレクトされる' do
        user = User.create(username: 'testuser', email: 'testuser@example.com', password: 'password', password_confirmation: 'password')
        user_params = { user: { email: 'testuser@example.com', password: '123456789' } }
        post user_session_path, params: user_params
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
