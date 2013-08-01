class User < ActiveRecord::Base
  has_many :messages
  has_many :ravens
  has_many :received_messages, :source => :message, :through => :ravens
end
