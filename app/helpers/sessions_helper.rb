module SessionsHelper

	#Logs in the given user. Places a temp cookie.
	# automatically encrypted and secure.
	# only lasts until browser closes
	def log_in(user)
		session[:user_id] = user.id 
	end

	# 14-10-02 ksw...remember a user in a persistent session
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	#returns current logged-in user, if any
	def current_user
		if (user_id = session[:user_id]) # actually assigns if session value exists
			@current_user ||= User.find_by(id: session[:user_id]) #syntax like += 
		elsif (user_id = cookies.signed[:user_id])
			#raise  # 8.50 The tests still pass, so this branch is currently untested
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user				
			end
		end		
	end

	# listing 9.24 - Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

	# true is a user is logged in, false otherwise
	def logged_in?
		!current_user.nil?
	end

	# 14-10-02 ksw...to 'forget' a persistent session
	#          when user when logs out, Listing 8.39
  def forget(user)
  	user.forget
  	cookies.delete(:user_id)
  	cookies.delete(:remember_token)
  end

	# 14-10-02 ksw...added destroy action for logging out
	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	# Redirects to stored location (or to the default).
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	# Stores the URL trying to be accessed.
	def store_location
		session[:forwarding_url] = request.url if request.get?
	end

	
end
