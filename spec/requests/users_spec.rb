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
      it 'ユーザー登録ができる' do
        user_params = { user: { username: 'newuser', email: 'newuser@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(dashbord_path) 
      end
    end

    context '不正なパラメータの場合' do
      it 'ユーザー登録ができない' do
        user_params = { user: { username: '', email: 'user@example.com', password: 'password', password_confirmation: 'password' } }
        expect {
          post user_registration_path, params: user_params
        }.not_to change(User, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end
