class Message < ActiveRecord::Base
  has_many :ravens

  encrypt_with_public_key :title, key_pair: Rails.root.join('config','keypair.pem')
  encrypt_with_public_key :body, key_pair: Rails.root.join('config','keypair.pem')
end
