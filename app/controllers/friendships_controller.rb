class FriendshipsController < ApplicationController
	def create		
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Dude, we're friends"
			redirect_to users_path
		else
			flash[:notice] = "Wtf?"
			redirect_to users_path
		end
	end
end
