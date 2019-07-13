class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
  end
 
  def unsubscribed
    
  end
  
  def appear
    p 'Success calling appear in the server "chat_rooms_channel"---------------------------------'
    current_user.appear
  end

  def disappear
    p 'chatroomdisappear---------------------------------'
    current_user.disappear
  end

#   def appear(data)
#     p 'appear---------------------------------'
#     p data
#     current_user.appear(on: data['appearing_on'])
#     p data
#   end

#   def disappear(data)
#     p 'disappear---------------------------------'
#     p data
#     current_user.disappear(on: data['appearing_on'])
#   end
 
#   def away
#     current_user.away
#   end
end
