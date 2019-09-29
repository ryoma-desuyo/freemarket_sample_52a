class ProductImage < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user, optional:true

  mount_uploader :image, ImageUploader
end
