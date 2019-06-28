class MessagesController < ApplicationController
    def upload_image
        p message_params
        message = current_user.messages.create(message_params)
        # message.image.attach(message_params[:image])
    end

    private

    def message_params
        params.require(:message).permit(:image, :message_type, :chat_room_id)
    end
end