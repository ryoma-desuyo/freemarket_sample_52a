class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :password, presence: true, length: {in: 7..128}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :products

  has_many :cards

  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :selling_products, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Product"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create(birthday: 00000000) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end