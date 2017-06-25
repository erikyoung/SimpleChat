class MessagesController < ApplicationController
	def new
		@message = Message.new
		@users = current_user.friends
	end

	def index
		@messages = current_user.received_messages
	end

	def show
		@message = Message.find_by(id: params[:id])
		@message.is_read = true
		@message.update(read_at: Time.now)
		@message.save!
	end

	def sent
    @user = User.find(current_user.id)
    @messages = @user.sent_messages
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

  private
  def message_params
    params.require(:message).permit(:subject, :body, :recipient_id)
  end

end
