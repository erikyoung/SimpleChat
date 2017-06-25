class UsersController < ApplicationController
def index
	@users = User.all
end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		flash[:success] = "Welcome #{@user.name}"
		current_user = @user
		redirect_to users_path
	else
		flash[:error] = "Yikes! Password did not match!"
		render 'new'
  	end
end

def edit
	@user = User.find_by(id: params[:id])
	end

  def show
  	@user = User.find_by(id: params[:id])
  end

  

def update
	@user = User.find_by(id: params[:id])
	if @user.save
		flash[:success] = "Thank you."
		redirect_to users_path, flash: {success: "Thank you for editing."}
	else
		render 'new'
 	end	
 end




private

def user_params
	params.require(:user).permit(:name, :email, :password, :image_url)
end
end







