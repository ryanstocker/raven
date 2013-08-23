class Message < ActiveRecord::Base
  has_many :ravens
  has_many :recipients, through: :ravens, source: :user
  accepts_nested_attributes_for :recipients

  encrypt_with_public_key :title, key_pair: Rails.root.join('config','keypair.pem')
  encrypt_with_public_key :body, key_pair: Rails.root.join('config','keypair.pem')
end
