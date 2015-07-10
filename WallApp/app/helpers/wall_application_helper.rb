module WallApplicationHelper

	def log_in(user)
		session[:user_id] = user._id
	end

	def current_user
    	#@current_user ||= User.find(_id: session[:user_id])
    	@current_user ||= User.find({'_id' => {"$in" => session[:user_id]}})
    end

    def log_out
    	session.delete(:user_id)
    	@current_user = nil
    end

end
