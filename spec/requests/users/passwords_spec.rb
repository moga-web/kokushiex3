require 'rails_helper'

RSpec.describe 'Users::passwords' do
  let(:user) { create(:user) }

  describe 'GET /users/password/new' do
    it 'パスワードリセットリクエスト送信先入力用のformが表示される' do
      get '/users/password/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users/password' do
    let(:params) { { user: { email: user.email } } }

    it 'パスワードリセットメールが送信後リダイレクトされる' do
      expect do
        post('/users/password', params:)
        expect(response).to redirect_to('/users/sign_in')
      end.to change { user.reload.reset_password_sent_at }.from(nil)
    end
  end

  describe 'GET /users/password/edit' do
    let(:reset_password_token) { Devise.token_generator.digest(User, :reset_password_token, 'abcdef') }

    it 'パスワード変更画面が表示される' do
      get '/users/password/edit?reset_password_token=abcdef'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /users/password' do
    let(:reset_password_token) { user.send(:set_reset_password_token) }
    let(:params) do
      {
        user: {
          reset_password_token:,
          password: 'new-password',
          password_confirmation: 'new-password'
        }
      }
    end

    it 'パスワードが更新される' do
      put('/users/password', params:)
      user.reload
      expect(user.valid_password?('new-password')).to be true
      expect(user.reset_password_token).to be_nil
    end
  end
end
