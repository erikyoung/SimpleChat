class MessagesController < ApplicationController

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

  private
  def message_params
    params.require(:message).permit(:subject, :body, :recipient_id)
  end

end
