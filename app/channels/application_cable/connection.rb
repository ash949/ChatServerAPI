module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      params = request.query_parameters
      self.current_user = find_verified_user(params["access-token"], params["uid"], params["client"])
    end

    protected
    def find_verified_user token, uid, client_id
      user = User.find_by(email: uid)
      if user && user.valid_token?(token, client_id)
        user
      else
        reject_unauthorized_connection
      end
    end   
  end
end
