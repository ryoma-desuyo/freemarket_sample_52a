class Product < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  
  belongs_to :user, optional:true

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  has_one :like

  validates :name, :description, :product_category, :condition, :delivery_fee, :shipping_area, :days_before_shipping, :price, :seller_id, presence: true
  
end
