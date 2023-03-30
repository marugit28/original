# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーション名
  大人の娯楽/お酒の勧め　その他検討中

# アプリケーション概要
  お酒の種類別・作り方・地域別・度数や気分に応じた検索を可能にし、販売と購入・いいね・コメント機能にて、お酒のコミュニティの拡大を図る

# URL ※
# テスト用アカウント
  ・Basic認証パスワード
  ・Basic認証ID
  ・メールアドレス
  ・パスワード

# 利用方法
  お酒の投稿

    1.トップページのヘッダー部分からユーザー新規登録を行う
    2.新規投稿ボタンから、お酒の内容（名前・分類・度数・画像・説明・飲みたい気分）を入力し投稿する
    
  リアクション

    1.一覧ページやカテゴリ検索から商品をクリックして、お酒の詳細を確認する
    2.気に入ったものがあれば、会社のフォロー・お気に入り・コメントを投稿する

# アプリケーションを作成した背景
  学生アルバイト時代に、お酒の作り方が覚えられず、何の種類なのかなども説明できるまで時間がかかった。同じ経験をされている新成人の方などもいるのではないかと考えた。
  世の中には、いろんなお酒があり、苦手な人でも美味しく飲めるお酒があること、お酒を好む人同士のコミュニティを作りたいと思った。
  同時に販売購入ができれば、一つのサイトの中で、購入者は簡単に気になった商品を取得でき、販売者はお酒を世に広めることができると考えた。

# 洗い出した要件
  要件を定義したシート

# 実装した機能についての画像やGIFおよびその説明 ※

# 実装予定の機能
お酒の投稿
種類別・作り方・地域別・度数や気分に応じた検索
詳細画面
購入機能
クレジットカード
いいね
コメント機能


# テーブル設計
## users
|Column                  |Type    |Options                 |
| ---------------------- | ------ | ---------------------- |
|nickname                |string  |null: false             |
|email                   |string  |null: false,unique: true|
|encrypted_password      |string  |null: false             |
<!-- |age                     |integer |null: false             | -->
|region_id               |integer |null: false             |
<!-- |gender_id               |integer |null: false             | -->
|last_name               |string  |null: false             |
|first_name              |string  |null: false             |
|last_name_kana          |string  |null: false             |
|first_name_kana         |string  |null: false             |
|birthday                |date    |null: false             |

### Association
has_many :orders
has_many :comments

## items
|Column                |Type      |Options                      |
| ----------           | ----     | --------------------------- |
|itemname              |string    |null: false                  |
|explanation           |text      |null: false                  |
|category_id           |integer   |null: false                  |
|degree_id             |integer   |null: false                  |
|region_id             |integer   |null: false                  |
|scheduled_delivery_id |integer   |null: false                  |
|atmosphere_id         |intger    |null: false                  |
|user                  |references|null: false,foreign_key: true|
|price                 |integer   |null: false                  |

### Association
has_many :orders
belongs_to :company
has_many :comments


## company
|Column             |Type      |Options                      |
| -------------    | ------   | ---------                   |
|company_name      |string    |null: false                  |
|email             |string    |null: false                  |
|encrypted_password|string    |null: false                  |
|region_id         |integer   |null: false                  |?
|explanation      |text      |null: false,foreign_key: true|?

### Association
has_many :orders
has_many :comments
has_many :items

## orders
|Column         |Type      |Options                      |
| ------------- | ------   | --------------------------- |
|item           |references|null: false,foreign_key: true|
|user           |references|null: false,foreign_key: true|

### Association
belongs_to :item
belongs_to :user
has_one :place

## places
|Column         |Type      |Options                      |
| ------------- | ------   | ---------                   |
|postcode       |string    |null: false                  |
|region_id      |integer   |null: false                  |
|municipality   |string    |null: false                  |
|address        |string    |null: false                  |
|building       |string    |                             |
|tell           |string    |null: false                  |
|order          |references|null: false,foreign_key: true|
### Association
belongs_to :order

## comments
|Column         |Type      |Options                      |
| ------------- | ------   | ---------                   |
|lank_id        |integer   |null: false                  |
|comment        |text      |null: false                  |
|user_id        |references|null: false,foreign_key: true|
|item_id        |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :company
belongs_to :item

## favorities
|Column         |Type      |Options                      |
| ------------- | ------   | ---------                   |
|user_id        |references|null: false,foreign_key: true|
|item_id        |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :company
belongs_to :item
# 画面遷移図
https://gyazo.com/615c3a12e51152e3b5c19fb1cc8cddda


# 開発環境
  ・フロントエンド
  ・バックエンド
  ・インフラ
  ・テスト
  ・テキストエディタ
  ・タスク管理
  
# ローカルでの動作方法 ※
# 工夫したポイント ※