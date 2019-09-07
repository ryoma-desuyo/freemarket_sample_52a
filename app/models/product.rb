class Product < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  validates :name, :description, :category, :brand, :condition, presence: true
  
end
