## アプリ名：Skillup-Navi

## 概要
ビジネススキル総合口コミサイト。

## 利用方法


## 定義した問題と解決方法
日本では、学習・自己研鑽している社会人が全体の3~4割程度と言われています。
世界水準と比較して低いという問題もありますが、特に普段から学習習慣がなければ、何から情報を得るべきか分かりづらいという問題もあります。
総合的に情報収集できる

##利用方法
ビジネススキルの習得を目的としたユーザーのために、そのためのサービス等を利用する際の判断材料としてご利用頂きます。
・他者の投稿やそれに対するコメントを閲覧できます。
・ログインすることで、投稿することができます。
・ログインすることで、他者の投稿へコメントをつけることができます。
・媒体やジャンル別で検索することができます。(予定)

## URL・テスト用アカウント
http://54.238.81.173/
投稿用ID：test1@test1
投稿用PASS：test1test1
コメント用ID:test2@test2
コメント用PASS:test2@test2
※閲覧のみであればログイン不要です。




## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :contents
- has_many :messages

## contents テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| media   | string | null: false |
| genre   | string | null: false |
| introduction   | string | null: false |
| image   | string | null: false |
| url   | string | null: false |
| user_id   | references | null: false, foreign_key: true|
| judge   | integer | null: false |

### Association

- belongs_to :content
- has_many :messages

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| point | integer     | null: false|
| text | text     | null: false|
| user_id    | references | null: false, foreign_key: true |
| content_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :content
