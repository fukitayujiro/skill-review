# アプリ名：Skillup-Navi








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
