# README

# アプリケーション名
### temiyage

# アプリケーションの概要
### ユーザー登録すると手土産を投稿することができます。自身が投稿した商品は、編集と削除をすることができます。他のユーザーが投稿した商品は、いいね！をすることができます。（いいね！今後実装したい）

# URL
## Renderによるデプロイ
### https://temiyage.onrender.com

## Basic認証
### ・ID:admin
### ・Pass：2222

# テスト用アカウント（投稿者用、閲覧者用）

## 投稿者用

### ・メールアドレス: tanaka@gmail.com
### ・パスワード: Tanaka1

## 閲覧者用

### ・メールアドレス: yamada@gmail.com
### ・パスワード: Yamada1

# 利用方法①〜⑤

## ①アカウントの登録
### 新規登録ボタンから、必要事項を入力して登録する

## ②手土産の投稿
### トップ画面の投稿するのボタンから、必要事項を入力して投稿する

## ③手土産一覧ページの閲覧
### トップページから、全国一覧（トップページ中部）または手土産一覧（ページ上部）をクリックすると投稿一覧ページに遷移する

## ④商品詳細ページの閲覧
### 商品一覧ページから、手土産の画像をクリックすると詳細yぽページに遷移する。商品名、商品説明文、投稿者、カテゴリー、購入できる都道府県、１０名あたりの予算、購入できる季節を確認することができる。

## ⑤手土産の編集、削除機能
### 投稿したユーザーが商品詳細ページに遷移すると、商品編集ボタンと商品削除ボタンが表示される。編集ボタンをクリックすると、商品詳細ページの内容を編集することができる。削除ボタンを押すと、投稿した手土産を削除しトップページに自動で遷移される。

# 実装機能



# テーブル設計

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
