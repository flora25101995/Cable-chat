class MessageBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                   message: render_message(message)
    end
    private

    def render_message(message)
      
      # trả lại giá trị có định dạng như trong _message.html.erb
      MessagesController.render partial: 'messages/message', locals: {message: message}
    
    end
  end
  