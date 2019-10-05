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

  devise   :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  has_many :sns_credentials, dependent: :destroy

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
 
    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end