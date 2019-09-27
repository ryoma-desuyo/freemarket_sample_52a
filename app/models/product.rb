class Product < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  
  belongs_to :user, optional:true

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  has_one :like

  mount_uploader :image, ImageUploader
  
end
