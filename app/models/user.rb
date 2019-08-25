class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  validates :password, presence: true, length: {in: 7..128}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

end
