# class AppearanceBroadcastJob < ApplicationJob
#   queue_as :default

#   def perform(user)
#     ActionCable.server.broadcast "AppearanceChannel", {event: 'appear', user_id: self.id, room: self.current_room}
#   end

    
# end
