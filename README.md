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
