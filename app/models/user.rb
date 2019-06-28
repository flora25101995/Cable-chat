class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  def name
    email.split('@')[0]
  end

  
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
