class User < ApplicationRecord
  rolify
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  # tạo chat room khi user tồn tại
  def get_chat_room
    if self.chat_rooms.empty?
      p "something"
      self.chat_rooms.create
    end
    return self.chat_rooms
  end
  

  # được gọi khi user login vào
  def appear()
    p 'Calling appear in the User model---------------------------------'
    self.online = true
    self.save
    p self.online
    ActionCable.server.broadcast "appearance_channel", {online: true, user_id: self.id}
  end

  # được gọi khi user logout
  def disappear()
    p 'modeldisappear---------------------------------'
    self.online = false
    self.save
    ActionCable.server.broadcast "appearance_channel", {online: false, user_id: self.id}
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
end
