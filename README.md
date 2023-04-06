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
  Original

# アプリケーション概要
  お酒の種類別・作り方・地域別・度数や気分に応じた検索を可能にし、販売と購入・いいね・コメント機能にて、お酒のコミュニティの拡大を図る

# URL 
https://original-38923.onrender.com

# テスト用アカウント
  ・Basic認証パスワード: admin  
  ・Basic認証ID : 2222  
  ・メールアドレス :test_user@hoge.com  
  ・パスワード :testuser1234

# 利用方法

  URLのリンクよりHPに遷移し、Basic認証を行った上でログインして使用する。


# アプリケーションを作成した背景
  学生アルバイト時代に、お酒の作り方が覚えられず、何の種類なのかなども説明できるまで時間がかかった。同じ経験をされている新成人の方などもいるのではないかと考えた。  
  世の中には、いろんなお酒があり、苦手な人でも美味しく飲めるお酒があること、ご当地などあまり知られていないお酒があることから、いろいろなお酒を検索できるようにしたいとと考えた。  
  お酒を好む人同士のコミュニティができると、趣向の近い商品を探しやすくなると考えた。  
  同時に販売購入ができれば、一つのサイトの中で、購入者は簡単に気になった商品を取得でき、販売者はお酒を世に広めることができると考えた。

  
# 工夫したポイント
1つ目がアプリのビュー表示です。お酒を多く提供しているバーをイメージして、少し暗めのシックな茶色をベースにデザインしました。  今後は、カテゴリー別の背景など、大勢の飲み会のカテゴリ別では明るい色を用いたり、動きのあるCSSの導入によって、より凝ったデザインにしていきたいです。  
2つ目が本アプリケーションのポイントでジャンルのカテゴライズ機能です。  カテゴリー管理にはancestryというRuby gemを用い、複数改装で管理できるようにしました。  また、カテゴリーを各々が作成できる機能を設けました。  しかし、これにはある課題が生じ、現在は機能を取り外しています。詳細は後述します。  

# 洗い出した要件
  https://docs.google.com/spreadsheets/d/1n2N3016WCC5XFG8A7y6o-Gw18YdkNlXrnL6ZNUWUsuI/edit#gid=1785908763  


# 実装した機能についての画像やGIFおよびその説明 
  トップページ左上のプルダウンよりユーザー新規登録・ログインができます。  
  ログインすると商品の出品ができるようになり、出品者は商品情報の編集・削除が可能です。  
  出品者以外は購入ができるようになり、クレジットカード決済が可能です。  
  トップページプルダウンよりカテゴリ別の商品表示ができます（※現在中止中）  
  商品詳細ページではコメントの投稿機能があり、評価と合わせてコメントが投稿できます。

  お酒の投稿

    1.トップページのヘッダー部分からユーザー新規登録を行う
    2.新規投稿ボタンから、お酒の内容（名前・分類・度数・画像・説明・雰囲気・発送までの日数・カテゴリー）を入力し投稿する
    
  リアクション

    1.一覧ページやカテゴリ検索から商品をクリックして、お酒の詳細を確認する
    2.気に入ったものがあれば、会社のフォロー・お気に入り・コメントを投稿する
    3.購入できる  
  
  トップページから新規登録画面への遷移  
https://gyazo.com/0d35a4e92f9d8101ef5b7c97432e053e  
新規登録画面より登録  
https://gyazo.com/1c7e413d28cb4dc2b7b4fbe97abbb4e2    
商品出品  
https://gyazo.com/f7b72f87f7a8a2e5c72c357fc3d09ce0  
詳細画面から購入画面に遷移  
https://gyazo.com/2ab90144950a0861578db9745d854934  
商品購入  
https://gyazo.com/4d0a1c1654fc58b9b35913161b24f5c4  
エラーハンドリング  
https://gyazo.com/e8ca510b7ecaf8409ae227f7954a1ab0


# 実装予定の機能
種類別・作り方・地域別・度数や気分に応じた検索
いいね機能
お気に入り機能
投稿済みのお酒の分布を視覚化するグラフ
カテゴリー分類機能
APIを用いて日本地図との連携

# テーブル設計
## users
|Column                  |Type    |Options                 |
| ---------------------- | ------ | ---------------------- |
|nickname                |string  |null: false             |
|email                   |string  |null: false,unique: true|
|encrypted_password      |string  |null: false             |
|age                     |integer |null: false             | 
|region_id               |integer |null: false             |
|gender_id               |integer |null: false             | 
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
  

