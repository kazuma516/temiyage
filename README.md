# README

#アプリ名
###temiyage

#アプリケーションの概要
###ユーザー登録すると手土産を投稿することができます。自身が投稿した商品は、編集と削除をすることができます。他のユーザーが投稿した商品は、いいね！をすることができます。（いいね！未実装）

#アプリの種類
###情報収集アプリ

#URL
###Lenderによるデプロイ

###Basic認証
###・ID:admin
###・Pass：2222


#　テーブル設計

## users テーブル

| Colum                      | Type   | Options                  |
| -------------------------- | -----  | ------------------------ |
| nickname                   | string | null: false,             |
| email                      | string | null: false, unique: true|
| encrypted_password         | string | null: false,             |
| last_name                  | string | null: false              |
| first_name                 | string | null: false              |
| last_name_kana             | string | null: false              |
| first_name_kana            | string | null: false              |
| birthday                   | date   | null: false              |

### Association

- has_many :posts
- has_many :favorites

## posts テーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| title              | string     | null: false                   |
| introduction       | text       | null: false                   |
| buy_prefecture_id  | integer    | null: false                   |
| price_id           | integer    | null: false                   |
| category_id        | integer    | null: false                   |
| season_id          | integer    | null: false                   |


### Association

- belongs_to :users
- has_many:favorites

## favorites テーブル

| Colum | Type       | Options                       |
| ----  | ---------- | ----------------------------- |
| user  | references | null: false, foreign_key:true |
| post  | references | null: false, foreign_key:true |

### Association

- belongs_to :users
- belongs_to :posts
