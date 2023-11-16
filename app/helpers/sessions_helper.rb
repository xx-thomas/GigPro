module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
		reset_session
		@current_user = nil
	end

	def current_user
		if session[:user_id]
			@current_user = @current_user || User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end
	# For later use, if we want to redirect after login
	# def store_location
	# 	session[:forwarding_url] = request.original_url if request.get? 
	# end
end
