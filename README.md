## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false|
|password|string|null: false|
|family-name|string|null: false|
|first-name|string|null: false|
|family-name-kana|string|null: false|
|first-name-kana|string|null: false|
|birthday|string|null: false|
|postal-code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house-number|text|null: false|
|building-name|string||
|phone-number|string||
|profile-icon|string||
|self-introduction|text||

### Association
- has_one :shipping
- has_one :user-evaluation
- has_many :products
- has_many :likes



## shippingsテーブル

|Column|Type|Options|
|------|----|-------|
|use_id|integer|null: false, foreign_key: true|
|family-name|string|null: false|
|first-name|string|null: false|
|family-name-kana|string|null: false|
|first-name-kana|string|null: false|
|postal-code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house-number|text|null: false|
|building-name|string||
|phone-number|string||

### Association
- belongs_to :user




## user-evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|good|integer||
|normal|integer||
|bad|integer||

### Association
- belongs_to :user



## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false, index: true|
|product-category_id|integer|null: false, foreign_key: true|
|product-brand_id|integer|foreign_key: true|
|condition|text|null: false|
|delivery-fee|text|null: false|
|shipping-area|string|null: false|
|days-before-shipping|text|null: false|
|price|integer|null: false|
|sales-commition|integer|null: false|
|sales-profit|integer|null: false|
|status|string|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :product-images
- belongs_to :product-category
- belongs_to :brand
- has_one :like
- has_many :product-evaluations




## product-evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|evaluation-for-seller|string|null: false|
|evaluation-for-buyer|string|null: false|

### Association
- belongs_to :product




## product-imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product



## product-categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|parent-id|integer|null: false|

### Association
- has_many :products



## product-brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|parent-id|integer|null: false|

### Association
- belongs_to :product



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
