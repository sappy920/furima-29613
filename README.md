## Usersテーブル

|Column                |   Type     |Options                  |
|----------------------|------------|-------------------------|
| name                 | string     |null: false              |
| email                | string     |null: false, unique: true|
| encrypted_password   | string     |null: false              |
| family_name          | string     |null: false              |
| last_name            | string     |null: false              |
| kana_family_name     | string     |null: false              |
| kana_last_name       | string     |null: false              |
| birthday             | date       |null: false              |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

|Column                |    Type         |Options                         |
|----------------------|-----------------|--------------------------------|
| price                | integer         |null: false                     |
| name                 | string          |null: false                     |
| instruction          | text            |null: false                     |
| category             | integer         |null: false                     |
| status               | integer         |null: false                     | 
| delivery_fee         | integer         |null: false                     |
| prefecture           | integer         |null:false                      |
| delivery_date        | integer         |null: false                     |
| user                 | references      |null: false, foreign_key: true  |

### Association
 - belongs_to :user
 - has_one :purchase

## Purchasesテーブル

|Column                 |    Type         | Options                         |
|-----------------------|-----------------|---------------------------------|
| user                  | references      |null: false, foreign_key: true   |
| item                  | references      |null: false, foreign_key: true   |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressテーブル

|Column                 |    Type         | Options                       |
|-----------------------|-----------------|-------------------------------|
| post_code             | string          |null: false                    |
| prefecture            | integer         |null: false                    |
| city                  | string          |null: false                    |
| address_number        | string          |null: false                    |
| apartment             | string          |                               |
| phone_number          | string          |null: false                    |
| purchase              | references      |null: false, foreign_key: true |

### Association
- belongs_to :purchase