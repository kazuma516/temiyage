## README

## アプリケーション名
### temiyage

## アプリケーションの概要
 ユーザー登録すると手土産を投稿することができます。自身が投稿した商品は、編集と削除をすることができます。他のユーザーが投稿した商品は、お気に入りをすることができます。（お気に入り登録機能は今後実装したい）

## URL
### Renderによるデプロイ
 https://temiyage.onrender.com

### Basic認証
 ・ID:admin
 ・Pass：2222

## テスト用アカウント（投稿者用、閲覧者用）

### 投稿者用

 ・メールアドレス: tanaka@gmail.com
 ・パスワード: Tanaka1

### 閲覧者用

 ・メールアドレス: yamada@gmail.com
 ・パスワード: Yamada1

## 利用方法①〜⑤

### ①ユーザーの登録
 新規登録ボタンから、必要事項を入力して登録する

### ②手土産の投稿
 トップ画面の投稿するのボタンから、必要事項を入力して投稿する

### ③手土産一覧ページの閲覧
 トップページから、全国一覧（トップページ中部）または手土産一覧（ページ上部）をクリックすると投稿一覧ページに遷移する

### ④商品詳細ページの閲覧
 商品一覧ページから、手土産の画像をクリックすると詳細ページに遷移以下の（７）つをすることができる。（１）商品名、（２）商品説明文、（３）投稿者、（４）カテゴリー、（５）購入できる都道府県、（６）１０名あたりの予算、（７）購入できる季節を確認することができる。

### ⑤手土産の編集、削除機能
 投稿したユーザーが商品詳細ページに遷移すると、商品編集ボタンと商品削除ボタンが表示される。編集ボタンをクリックすると、商品詳細ページの内容を編集することができる。削除ボタンを押すと、投稿した手土産を削除しトップページに自動で遷移される。

## アプリケーションを作成した背景

### 手土産を送る際、良いものを短時間で選びたいという課題の解決
 手土産をあげる時、何をあげよう、どんなものがあるんだろうと悩んだ経験がある方が多い。その時に手土産には、どんなものがあるのかをまとめて閲覧し、商品の詳細情報がしれたら時間を有効に使えると考え作成した。

## 洗い出した要件

 https://docs.google.com/spreadsheets/d/1bAatjwYAi5cCN4_0SgR00LpPbUmM-12cRGmBKVxeP0I/edit#gid=982722306

## 実装機能

### トップページ

 [![Image from Gyazo](https://i.gyazo.com/f8314bd3cedf48447def90026b959b10.gif)][def2]

### 商品一覧表示機能

[![Image from Gyazo](https://i.gyazo.com/d17b6266ddcc9ad571cb1bb5ef1ec82c.gif)][def]

### ユーザー登録機能

 [![Image from Gyazo](https://i.gyazo.com/59fe8b43200a0177cab2ce4f940d0a2f.gif)](https://gyazo.com/59fe8b43200a0177cab2ce4f940d0a2f)

### 商品投稿機能

 [![Image from Gyazo](https://i.gyazo.com/c3d460cdd4c10ac2d437e8d896e82102.gif)](https://gyazo.com/c3d460cdd4c10ac2d437e8d896e82102)

### 商品の編集機能

 [![Image from Gyazo](https://i.gyazo.com/7213bc1eb54c8f7c5e689474d6843948.gif)](https://gyazo.com/7213bc1eb54c8f7c5e689474d6843948)

### 商品の削除機能

 [![Image from Gyazo](https://i.gyazo.com/1254cc9162b00244177aac9fffee748b.gif)](https://gyazo.com/1254cc9162b00244177aac9fffee748b)

## ER図

 [![Image from Gyazo](https://i.gyazo.com/cc7791756229ae59909d0143bc0ef0cb.png)](https://gyazo.com/cc7791756229ae59909d0143bc0ef0cb)

## 画面遷移図

 [![Image from Gyazo](https://i.gyazo.com/ffe1e8a0aa10aabfff5a906f4b5e46d7.png)](https://gyazo.com/ffe1e8a0aa10aabfff5a906f4b5e46d7)

## テーブル設計

### users テーブル

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

#### Association

- has_many :posts
- has_many :favorites

### posts テーブル

| Colum              | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| title              | string     | null: false                   |
| introduction       | text       | null: false                   |
| buy_prefecture_id  | integer    | null: false                   |
| price_id           | integer    | null: false                   |
| category_id        | integer    | null: false                   |
| season_id          | integer    | null: false                   |


#### Association

- belongs_to :users
- has_many:favorites

### favorites テーブル

| Colum | Type       | Options                       |
| ----  | ---------- | ----------------------------- |
| user  | references | null: false, foreign_key:true |
| post  | references | null: false, foreign_key:true |

#### Association

- belongs_to :users
- belongs_to :posts

## clone

 % git clone https://github.com/kazuma516/temiyage.git
 % cd temiyage
 % bundle install
 % rails db:create
 % rails db:migrate
 % yarn install

[def]: https://gyazo.com/d17b6266ddcc9ad571cb1bb5ef1ec82c
[def2]: https://gyazo.com/f8314bd3cedf48447def90026b959b10