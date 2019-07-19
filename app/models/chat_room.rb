class ChatRoom < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :messages, dependent: :destroy
end
