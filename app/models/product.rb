class Product < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  
  belongs_to :user, optional:true
  has_many :images
  #belongs_to :product_category_id
  #belongs_to :brand
  has_one :like

  
end
