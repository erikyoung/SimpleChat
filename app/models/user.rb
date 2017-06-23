class User < ApplicationRecord

has_secure_password
validates :email, presence: true, uniqueness: true



def received_messages
	Message.where(recipient_id: id)
	end

def unread_messages
	received_messages.where(read_at: nil)
end

def sent_messages
	Message.where(sender_id: id)
end

end
