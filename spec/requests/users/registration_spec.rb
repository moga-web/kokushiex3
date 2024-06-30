require 'rails_helper'

RSpec.describe 'Users::registrations' do
  let(:user) {create(:user)}

  describe "GET /users/sign_up" do
    it "ユーザー登録画面が表示される" do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users/sign_up" do
    let(:valid_user_params) { { user: { username: 'newuser', email: 'newuser@example.com', password: 'password', password_confirmation: 'password' } } }
    let(:invalid_user_params) { { user: { username: '', email: 'user@example.com', password: 'password', password_confirmation: 'password' } } }

    context '正常系' do
      it 'ユーザー登録後ダッシュボード画面にリダイレクトされる' do
        expect {
          post user_registration_path, params: valid_user_params
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(dashboard_path)
        expect(response).to have_http_status(:see_other)
      end
    end

    context '不正なパラメータの場合' do
      it 'ユーザー登録ができず新規登録画面にリダイレクトされる' do
        expect {
          post user_registration_path, params: invalid_user_params
        }.not_to change(User, :count)
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end