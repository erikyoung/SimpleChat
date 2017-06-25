class SessionsController < ApplicationController
def new 	
end

def create
	@user = User.find_by(email: params[:email])
	if @user
		if @user.authenticate(params[:password])
			flash[:success] = "Welcome! Signed In."
			session[:user_id] = @user.id #means user is now signed in 			
			redirect_to messages_path
		else
			flash.now[:error] = "Wrong password bro"
			render 'new'
		end

	else
		flash.now[:error] = "User not found"
		redirect_to action: 'new', show_hint: true
	end
 end

 def destroy
 	session[:user_id] = nil
 	redirect_to root_path, flash => "Logged out Bro" 
 end
end
