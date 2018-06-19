# README

本プロジェクトではサンプルとしてSNSらしきサービスを作っていく。

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
  * user_id
    * ユーザーのid番号
  * account_name
    * ユーザーアカウントの一意な名前（アルファベット)
  * email
    * メールアドレス
  * password
    * パスワード
  * user_name
    * 表示される名前

* Contribution(投稿)モデル
  * contribution_id
    * 投稿の一意なid
  * content
    * 投稿内容（文章）
  * date
    * 投稿された日付・時間
  * thread
  * 

* thread（スレッド）モデル

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
