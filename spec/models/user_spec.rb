require 'rails_helper'

RSpec.describe User, type: :model do
  describe '正常系' do
    it 'ユーザー登録ができる' do
      user = User.new(username: 'newuser', email: 'newuser@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
  end

  describe '異常系' do
    context 'usernameが空の場合' do
      it 'ユーザー登録ができない' do
        user = User.new(username: '', email: 'newuser@example.com', password: 'password', password_confirmation: 'password')
        expect(user).to be_invalid
      end
    end

    context 'email関連' do
      it 'emailが空の場合ユーザー登録ができない' do
        user = User.new(username: 'newuser', email: '', password: 'password', password_confirmation: 'password')
        expect(user).to be_invalid
      end

      it 'emailが重複している場合ユーザー登録ができない' do
        user1 = User.create(username: 'newuser1', email: 'newuser@example.com', password: 'password', password_confirmation: 'password')
        user2 = User.new(username: 'newuser2', email: 'newuser@example.com', password: 'password', password_confirmation: 'password')
        expect(user2).to be_invalid
      end
    end


    context 'passwordが空の場合' do
      it 'ユーザー登録ができない' do
        user = User.new(username: 'newuser', email: 'newuser@example.com', password: '', password_confirmation: 'password')
        expect(user).to be_invalid
      end

      it 'passwordが6文字未満の場合ユーザー登録ができない' do
        user = User.new(username: 'newuser', email: 'newuser@example.com', password: '12345', password_confirmation: '12345')
        expect(user).to be_invalid
      end
    end
  end
end
