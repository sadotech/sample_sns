# README

本プロジェクトではサンプルとしてSNSらしきサービスを作っていく。

## 開発環境
* ruby 2.1.5
* Rails 4.1.8

## 要件

* 個人で無制限に投稿できる
* ユーザー同士でフォロー/フォロワー関係になれる
* 自分のタイムラインには自分とフォロワーの投稿が流れる
* タイムライン上の投稿にはいいね！などのリアクションをつけることができる
* タイムライン上の他人の投稿を自分の投稿と同じように拡散することができる
  * 共有機能
* 各投稿に対してスレッドで会話をすることができる


## モデル

* User(ユーザー)モデル
  * id
    * ユーザーのid番号
  * account_id
    * ユーザーアカウントの一意な名前（アルファベット)
  * email
    * メールアドレス
  * password
    * パスワード
  * name
    * 表示される名前
  * thumbnail_id
    * サムネイル画像のid
  * following_users
    * フォローしているユーザー
  * followers
    * フォロワー
  * profile
    * プロフィールのid

* Post(投稿)モデル
  * id
    * 投稿の一意なid
  * id_of_posted_user
    * 投稿したユーザーのid
  * id_of_replied_post
    * 返信された投稿のid
  * date_time
    * 投稿された日付・時間
  * text_content
    * 投稿内容（文章）
  * image_content_id
    * 投稿画像のid
  * id_of_liked_user
    * いいね!をくれたユーザーのid
  * id_of_diffusion_user
    * 拡散したユーザーのid

* thumbnailモデル
  * 

* image_contentモデル
  * 

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


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
