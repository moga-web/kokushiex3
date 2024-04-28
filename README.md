# README
## サービス概要
サービス名：国試exforPT
## 概要
国試exforPTはオンライン上で理学療法士国家試験の過去問を受験できるサービスです。
- ユーザーはユーザー登録なしで受験できます
- 過去問は年度別、午前問題、午後問題等絞り込んで受験することもできます
- ユーザー登録したユーザーは受験結果の詳細なレポートを確認できます
- 受験結果を共有することができます

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- Ruby 3.3.1

* System dependencies
- Rails 7.0.8以上
- MySQLを使用

* Configuration
- 依存するGemやライブラリはGemfileに記載されています。
- `bundle install` 

* Database creation
- データベースはMySQLを使用しています。
- `rails db:create` 

* Database initialization
- `rails db:migrate`

* How to run the test suite
### テストスイートの実行方法
- `gem RSpec`を使用
- `bundle exec rspec` コマンドでテストを実行

* Services (job queues, cache servers, search engines, etc.)
- `rails`: アプリケーションのフレームワーク。
- `mysql2`: データベースとしてMySQLを使用。
- `puma`: HTTPサーバーとしてPumaを使用。
- `sprockets-rails`: アセットパイプラインを提供。
- `importmap-rails`, `turbo-rails`, `stimulus-rails`: JavaScriptのモダンな管理とページの高速化。
- `tailwindcss-rails`: スタイリングのためのTailwind CSS。
- `jbuilder`: JSON形式のAPIを構築。
- `bootsnap`: アプリケーションの起動時間の短縮。
- `rspec-rails`, `capybara`, `selenium-webdriver`: テスト用のGem。

* Deployment instructions
