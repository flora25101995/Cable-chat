module ApplicationHelper
  
  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def check_active_chatroom(room, current_room)
    p "room #{room} - chatroom: #{current_room}"
    if room.id.to_s == current_room&.id.to_s
      "contact active"
    else
      "contact"
    end
  end

  

end
