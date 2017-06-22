class SessionsController < ApplicationController
def new 	
end

def create
	@user = User.where(email: params[:email])
	if @user
		if @user.authenticate(params[:password])
			flash[:success] = "Welcome! Signed In."
			redirect_to root_path
		else
			flash.now[:error] = "Wrong password bro"
			render 'new'
		end

	else
		flash.now[:error] = "User not found"
		redirect_to action: 'new', show_hint: true
	end
 end
end
