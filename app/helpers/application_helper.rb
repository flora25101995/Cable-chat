module ApplicationHelper
  

  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  
  def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}.png"
  end


  # kiểm tra xem chat room có đang được chọn hay không
  def check_active_chatroom(room, current_room)
    p "room #{room} - chatroom: #{current_room}"
    if room.id.to_s == current_room&.id.to_s
      "contact active"
    else
      "contact"
    end
  end
  

  # trả giá trị này về _contact
  def user_online_status(status)
    if status == true
      "online"
    else
      "offline"
    end
  end


  

end
