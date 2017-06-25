class MessagesController < ApplicationController
	def new
		@message = Message.new
		@users = current_user.friends
	end

	def index
		@messages = current_user.received_messages
	end

	def show
		load_user
		@messages = current_user.sent_messages
		@message = Message.find_by(id: params[:id])		
		@message.read_at = Time.now
		@message.save
	end

	def sent
		load_user
		@user = User.find(current_user.id)
		@messages = current_user.sent_messages
		@message = Message.find_by(id: params[:id])
	end

	def load_user
		if params[:user_id]
			@user = User.find params[:user_id]
		else
			@user = current_user
		end
	end


  def create
  	@message = Message.new message_params
  	@message.sender = current_user
  	
  	if @message.save
  		flash[:success] = "Message sent!"
  		redirect_to messages_path
  	else
  		render 'new'
  	end
  end
  def update
  	@message = Message.last
  end

  private
  def message_params
    params.require(:message).permit( :subject, :body, :recipient_id)
  end
end
