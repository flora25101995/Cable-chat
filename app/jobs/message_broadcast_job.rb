class MessageBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                   {message: render_message(message), message_user_id: message.user_id}
    end
    private

    def render_message(message)
      
      # trả lại giá trị có định dạng như trong _message.html.erb
      MessagesController.render partial: 'messages/message', locals: {message: message, current_user: nil}
    
    end
  end
  