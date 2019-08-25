class SnsCredential < ApplicationRecord
  belongs_to :user
  has_many :sns_credential,
end
