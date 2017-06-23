class Message < ApplicationRecord
belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
belongs_to :recipient, class_name: 'User', foreign_key: 'recepient_id'
def sender
	@user ||= User.find_by(id: sender_id) || User.new(email: 'nobody@butt.you')
end


end
