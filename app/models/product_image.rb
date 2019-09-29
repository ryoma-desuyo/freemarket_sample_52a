class ProductImage < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user, optional:true
  has_many   :images

  mount_uploader :image, ImageUploader
end
