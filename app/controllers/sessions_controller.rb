class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
	    # Log user in, redirest to user's show page.
	    log_in user  # _helper defined method 
	    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
	    #remember user # _helper defined method, later replaced by line above
	    redirect_to user  #Rails converts to user_path(user)
	  else
	  	#create an error message.
	  	flash.now[:danger] = 'Invalid email/password combination' #not quite right.
	  	render 'new'
	  end
  end

  def destroy
  	# 14-10-02 ksw...added destroy action for logging out
	  log_out if logged_in?  # ksw...nice conditional syntax
	  redirect_to root_url
  end
end
