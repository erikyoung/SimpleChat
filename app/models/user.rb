class User < ApplicationRecord
has_many :friendships
has_many :friends, :through => :friendships
has_many :inversefriendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inversefriendships, :through => :inverse_friendships, :source => :user
has_secure_password
validates :email, presence: true, uniqueness: true

has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

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
