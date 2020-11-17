### 更新日時(直近5日程)
2020/11/17 検索ビューのリファクタリング。

2020/11/15 contentsコントローラーの単体テストコード実装。

2020/11/10 contentとmessageのそれぞれ投稿時の結合テストコード実装。

2020/11/9 userの新規登録・ログイン時の結合テストコード実装。

2020/11/7 user,messageモデルの単体テストコード実装。contentのeditページのレイアウトを修正。及びリファクタリング。

# アプリ名
SkillUp-Navi

# 概要
ビジネススキル総合レビューサイト

# 定義した問題と解決方法
日本では、学習・自己研鑽している社会人が全体の3~4割程度と言われています。

世界水準と比較して低いという問題もありますが、特に普段から学習習慣がなければ、何から情報を得るべきか分かりづらいという問題もあります。

総合的に情報収集できるレビューサイトがあれば、それらの解消の一助になると思い作成しています。

# 使用技術
HTML/CSS, Ruby, Ruby on Rails, JavaScript, AWS(EC2/S3), SQL, GitHub

# 利用方法
ビジネススキルの習得を目的としたユーザーのために、そのためのサービス等を利用する際の判断材料としてご利用頂きます。

・他者の投稿やそれに対するコメントを閲覧できます。

・ログインすることで、投稿することができます。

・ログインすることで、他者の投稿へコメントをつけることができます。

・媒体やジャンル別で検索することができます。(予定)

# URL・テスト用アカウント
http://54.238.81.173/

投稿用ID：test1@test1

投稿用PASS：test1test1

コメント用ID:test2@test2

コメント用PASS:test2@test2

※閲覧のみであればログイン不要です。

# 要件定義

| 機能   | 目的   | 詳細     |
| -------- | ------ | ----------- |
| トップページ実装 | ユーザーが当サイトのおおよその機能を把握し、利用可能にするため | トップページを実装し、左上にタイトル、右上にはヘッダーにログイン・マイページリンクを実装。左サイドバーには投稿機能と検索機能を実装。メインには次のコンテンツ一覧表示を実装 |
| コンテンツ一覧表示 | ユーザーが投稿・コメント内容を閲覧するため | トップページのメイン部に実装し、投稿内容が新着順に表示される。 |
| 自動デプロイ(AWS) | デプロイの実施およびデプロイ作業の簡略化のため | AWSを利用し、自動デプロイ機能を実装する。 |
| ユーザー登録 | ユーザーがログインすることでより多くの機能を使用できる権限を所有するため | 右上ヘッダーから新規登録ページへ遷移できる。名前とメールアドレス、パスワード必須。登録後はメールアドレスとパスワードでログインできる。 |
| コンテンツ投稿 | ユーザーがコンテンツを投稿するため | ログインしていることが前提。イメージ画像・タイトル・紹介文・URL・媒体・ジャンルを選択して投稿。投稿後はトップページへ遷移し、投稿内容は一覧表示に加わる。|
| コンテンツ詳細表示 | ユーザーがコンテンツに対する詳細を確認するため | 一覧もしくは検索結果から、投稿内容の詳細ページへ遷移できる。ログインしていればコメントを投稿できる。投稿者本人なら編集と削除の権限も加える。 |
| コンテンツ編集 | 投稿者が投稿後内容を編集するため | 投稿者本人がログインしていることが前提。詳細ページから投稿内容の編集することができる。 |
| コンテンツ削除 | 投稿者が投稿内容を削除するため | 投稿者本人がログインしていることが前提。詳細ページから投稿内容の削除することができる。  |
| コメント・評価機能 | ユーザーが投稿内容に対してコメントと評価をつけるため | ログインしていることが前提。詳細ページから投稿内容に対してコメントと点数をつけることができる。 |
| 評価表示機能 | コメントに寄せられた点数の総合評価を加えるため。 | コメントに付けられた点数の平均値を算出し、投稿一覧および詳細ページに記載する。 |
| ジャンル・媒体別検索機能 | ユーザーが探しているコンテンツを見つけやすくするため | サイドバーに項目を出力し、クリックするとそのジャンル・媒体ごとに投稿コンテンツを抽出する。 |
| マイページ機能 | 特定のユーザーの投稿物を抽出して表示するため| ヘッダー左上のマイページをクリックすると該当ユーザーのマイページへ遷移する。コメントのユーザー名をクリックすると該当ユーザーのマイページへ遷移する。 |
| ページネイション機能 | 投稿物が増えると１ページの表示量が嵩み、見辛い点を解消するため。| 投稿物が２０を超えた場合、それ以上は次ページ以降で表示され、そのリンクはページの末尾に表示される。 |

※今後実装予定の機能は下記に掲載。

# 実装予定の機能

CI / CDパイプライン

ブックマーク(コンテンツ・ユーザー)

コンセプト・使い方のページ

パンくずリスト

バリデーション

評価点の小数点表示

評価点数の算出方法見直し

一覧ページに評価表示(現時点では詳細ページのみ)


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
| user_id   | references | null: false, foreign_key: true|

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
