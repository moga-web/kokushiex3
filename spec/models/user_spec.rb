require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
