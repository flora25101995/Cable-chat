class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
  end
 
  def unsubscribed
    p 'chatroom   unsubcribed---------------------------------'
    current_user.disappear
  end
  
  def appear
    p 'Success calling appear in the server "chat_rooms_channel"---------------------------------'
    current_user.appear
  end

  def disappear
  end
end
