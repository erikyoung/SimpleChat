class Message < ApplicationRecord

def sender
	@user ||= User.find_by(id: sender_id)
end
end
