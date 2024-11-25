# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  unconfirmed_email      :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  describe '正常系' do
    it 'ユーザー登録ができる' do
      user = described_class.new(username: 'newuser', email: 'newuser@example.com', password: 'password',
                                 password_confirmation: 'password')
      expect(user).to be_valid
    end
  end

  describe '異常系' do
    context 'usernameが空の場合' do
      it 'ユーザー登録ができない' do
        user = described_class.new(username: '', email: 'newuser@example.com', password: 'password',
                                   password_confirmation: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'email関連' do
      it 'emailが空の場合ユーザー登録ができない' do
        user = described_class.new(username: 'newuser', email: '', password: 'password',
                                   password_confirmation: 'password')
        expect(user).not_to be_valid
      end

      it 'emailが重複している場合ユーザー登録ができない' do
        described_class.create(username: 'newuser1', email: 'newuser@example.com', password: 'password',
                               password_confirmation: 'password')
        user2 = described_class.new(username: 'newuser2', email: 'newuser@example.com', password: 'password',
                                    password_confirmation: 'password')
        expect(user2).not_to be_valid
      end
    end

    context 'passwordが空の場合' do
      it 'ユーザー登録ができない' do
        user = described_class.new(username: 'newuser', email: 'newuser@example.com', password: '',
                                   password_confirmation: 'password')
        expect(user).not_to be_valid
      end

      it 'passwordが6文字未満の場合ユーザー登録ができない' do
        user = described_class.new(username: 'newuser', email: 'newuser@example.com', password: '12345',
                                   password_confirmation: '12345')
        expect(user).not_to be_valid
      end
    end
  end
end
