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


## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | text    | null: false |
| password        | integer | null: false |
| last_name       | text    | null: false |
| first_name      | text    | null: false |
| last_name_kana  | text    | null: false |
| first_name_kana | text    | null: false |
| nickname        | text    | null: false |
| birthday        | date    | null: false |

### Association
belongs_many : orders
belongs_many : items


 ## addressテーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| prefectures   | text          | null: false                    |
| municipality  | text          | null: false                    |
| address       | text          | null: false                    |
| building_name | string        | null: false                    | 
| phone_number  | integer       | null: false                    |
| postal_code   | integer       | null: false                    |
| orders        | references    | null: false, foreign_key: true |

### Association
belongs_to : orders


## itemsテーブル


| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| product_description   | text    | null: false |
| product_name          | string  | null: false |
| product_details       | text    | null: false |
| delivery              | text    | null: false |
| selling_price         | integer | null: false |


### Association
has_one : orders
belongs_to : user



## ordersテーブル


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| users  | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |


### Association
has_one : address
belongs_to : items

