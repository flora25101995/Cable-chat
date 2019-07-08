class User < ApplicationRecord
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def name
    email.split('@')[0]
  end

  
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end


  def get_chat_room
    if self.chat_rooms.empty?
      p "something"
      self.chat_rooms.create
    end
    return self.chat_rooms
  end
  

  def appear(data)
    self.update(online: true, current_chat_rooms: data['on'])
    ActionCable.server.broadcast "AppearanceChannel", {event: 'appear', user_id: self.id, room: self.current_chat_rooms}
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
end
