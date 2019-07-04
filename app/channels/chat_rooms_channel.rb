class ChatRoomsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  
    def send_message(data)
      if data['image']
        p data['image']
        decoded_file = Base64.decode64(data['image'])
        begin 
          file = Tempfile.new(['test', '.jpg']) 
          file.binmode
          file.write decoded_file
          message = Message.new(user_id: current_user.id, chat_room_id: data['chat_room_id'], image: file)
          message.image = file
          message.save
          file.close
        
          # current_user.messages.create!(chat_room_id: data['chat_room_id'], image: file)
        ensure
          file.unlink
        end

      else

        current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
        
      end

    end

  end
  