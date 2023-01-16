## README

## アプリケーション名
### temiyage

## アプリケーションの概要
おすすめの手土産を投稿したり、他ユーザーのおすすめの手土産を参照することおができる情報収集アプリ。

ユーザー登録すると手土産を投稿することができる。自身が投稿した商品は、編集と削除をすることがでる。他のユーザーが投稿した商品は、検索をし、お気に入りをすることができる。（お気に入り登録機能、検索機能は今後実装予定です。）

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
 手土産を用意する際に、「何をあげよう」、「どんなものがあるんだろう」と悩んだ経験があることから作成した。
手土産には、どんなものがあるのかをまとめて閲覧することができ、商品の詳細情報を手軽に知ることができれば時間を有効に使えると考えた。

## 洗い出した要件

 https://docs.google.com/spreadsheets/d/1bAatjwYAi5cCN4_0SgR00LpPbUmM-12cRGmBKVxeP0I/edit#gid=982722306


## 実装機能

### トップページ

[![Image from Gyazo](https://i.gyazo.com/4b81c6867b15bff182c13abcb8284703.gif)](https://gyazo.com/4b81c6867b15bff182c13abcb8284703)

### 商品一覧表示機能

[![Image from Gyazo](https://i.gyazo.com/cd3bbcf4fa0b543081db2c76e43606c5.gif)](https://gyazo.com/cd3bbcf4fa0b543081db2c76e43606c5)

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

##### % git clone https://github.com/kazuma516/temiyage.git
##### % cd temiyage
##### % bundle install
##### % rails db:create
##### % rails db:migrate
##### % yarn install

## 工夫したポイント①〜③

一目で情報をインプットできるアプリケーションを作成することに努めた。具体的には以下の③点。①各都道府県の手土産が見れるようにレイアウトを考えたこと。トップページの関東地方のボタンをクリックすると１都6県が表示され、そこから各都道県の商品を見ることができる。（各都道府県のページは今後実装予定です。）②商品一覧ページは画像を中央に大きく表示させた。画像を見て商品の興味関心が高まれば良いと考えた。③商品新規投稿画面にプルダウンを多く用いた。出品者が簡単に投稿できるように工夫した。