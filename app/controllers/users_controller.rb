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
		redirect_to users_path
	else
		flash[:error] = "Yikes! Password did not match!"
		render 'new'
  end
end

  def show
  end

  def search
  if params[:search].present?
      @user = @user.search(params[:search])
   end
end


private

def user_params
	params.require(:user).permit(:name, :email, :password, :image_url)
end
end







