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

| Column     | Type   | Options                        |
| ---------- | ------ | ------------------------------ |
| email      | text | null: false, foreign_key: true |
| password   | integer | null: false, foreign_key: true |
| name       | text | null: false, foreign_key: true |
| nickname   | text   | null: false, foreign_key: true |
| birthday   | integer   | null: false, foreign_key: true |

### Association
belongs_to : orders
belongs_to : items


 ## addressテーブル

| Column                 | Type   | Options                        |
| ---------------------- | ------ | ------------------------------ |
| prefectures            | text   | null: false, foreign_key: true |
| municipalities         | text   | null: false, foreign_key: true |
| address                | text | null: false, foreign_key: true |
| building name          | string | null: false, foreign_key: true |
| phone number           | integer   | null: false, foreign_key: true |


### Association
belongs_to : users
belongs_to : items


## itemsテーブル


| Column                | Type   | Options                        |
| --------------------- | ------ | ------------------------------ |
| product image         | text | null: false, foreign_key: true |
| product description   | text | null: false, foreign_key: true |
| product name          | string | null: false, foreign_key: true |
| product details       | text   | null: false, foreign_key: true |
| delivery              | text   | null: false, foreign_key: true |
| selling price         | integer   | null: false, foreign_key: true |


### Association
belongs_to : orders
belongs_to : users



## ordersテーブル


| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| users               | references    | null: false, foreign_key: true |
| items              | references    | null: false, foreign_key: true |


### Association
belongs_to : orders
belongs_to : users

