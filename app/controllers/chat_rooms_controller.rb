class ChatRoomsController < ApplicationController
    def index

      @chat_rooms = ChatRoom.all
      search_value = params[:search]
      search_query = ChatRoom.joins(:user).where("users.email LIKE '%#{search_value}%'")
      search_user = User.where("users.email LIKE '%#{search_value}%'")

      if search_value
        @chat_rooms = search_query
      end
      

      if params[:search]
        users = User.includes(:chat_rooms).where("email ilike ?", "%#{search_value}%")
        if users.empty?
          redirect_to chat_room_path(1), danger: "Người dùng không tồn tại."
        end
        chat_rooms = users.map(&:get_chat_room)
      end

    end
  
    def new
      @chat_room = ChatRoom.new
    end
  
    def create
      @chat_room = current_user.chat_rooms.build(chat_room_params)
      if @chat_room.save
        flash[:success] = 'Chat room added!'
        redirect_to chat_rooms_path
      else
        render 'new'
      end
    end 
    
    def show
      @chat_rooms = ChatRoom.all
      @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
      @message = Message.new
    end

    private
  
    def chat_room_params
      params.require(:chat_room).permit(:title)
    end

    
end