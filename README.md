## Usersテーブル

|Column                |   Type     |Options                  |
|----------------------|------------|-------------------------|
| username             | string     |null: false              |
| email                | string     |null: false, unique: true|
| password             | string     |null: false              |
| password_confirmation| string     |null: false              |
| full_name            | string     |null: false              |
| kana_name            | string     |null: false              |
| birthday             | string     |null: false              |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|Column                |    Type         | Options                        |
|----------------------|-----------------|--------------------------------|
| photo                | string          |null: false                     |
| price                | string          |null: false                     |
| item_name            | string          |null: false                     |
| item_owner           | string          |null: false                     |
| instruction          | string          |null: false                     |
| category             | string          |null: false                     |
| status               | string          |null: false                     |
| delivery_fee         | string          |null: false                     |
| area                 | string          |null:false                      |
| delivery_date        | string          |null: false                     |
| user_id              | references      |null: false, foreign_key: true  |

### Association
 - belongs_to :user
 - has_one :purchase

## Purchasesテーブル

|Column                 |    Type         | Options                         |
|-----------------------|-----------------|---------------------------------|
| card_number           | string          |null: false                      |
| expiry                | string          |null: false                      |
| security_code         | string          |null: false                      |
| user_id               | references      |null: false, foreign_key: true   |
| item_id               | references      |null: false, foreign_key: true

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressテーブル

|Column                 |    Type         | Options                       |
|-----------------------|-----------------|-------------------------------|
| post_code             | string          |null: false                    |
| prefecture            | string          |null: false                    |
| city                  | string          |null: false                    |
| address_number        | string          |null: false                    |
| apartment             | string          |null: false                    |
| phone_number          | string          |null: false                    |
| purchase_id           | references      |null: false, foreign_key: true |

### Association
- belongs_to :purchase