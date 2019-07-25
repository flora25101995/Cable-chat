module ApplicationCable
  class Connection < ActionCable::Connection::Base
    
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      verified_user = User.find_by(id: cookies.signed['user.id'])
      p "verified user"  
      p verified_user
      # kiểm tra người dùng có được xác thực chưa
      if verified_user && cookies.signed['user.expires_at'] > Time.now
        verified_user
      else
        reject_unauthorized_connection
      end
    end
    
  end
end
