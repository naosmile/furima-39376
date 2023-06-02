# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |              
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| name_full width      | string  | null: false               |
| name kana_full width | string  | null: false               |
| day of birth         | integer | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |  
| image           | string     | null: false                    |                
| goods           | string     | null: false                    |
| explain         | string     | null: false                    |
| category        | string     | null: false                    |
| situation       | string     | null: false                    |
| shipping charge | string     | null: false                    |
| number of days  | integer    | null: false                    |
| price           | integer    | null: false                    |            
| user            | references | null: false, foreign_key: true |           

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |                            
| item    | references | null: false, foreign_key: true |                           

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post code        | integer    | null: false                    |            
| prefectures      | references | null: false, foreign_key: true |
| municipalities   | string     | null: false                    |
| address          | integer    | null: false                    |
| building name    | string     | null: false                    |
| telephone number | integer    | null: false                    |
| buy              | references | null: false, foreign_key: true |                             

### Association

- belongs_to :buy

