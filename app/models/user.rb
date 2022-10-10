class User < ApplicationRecord
    has_secure_password
    has_many :microposts  
    has_many :friend_request_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
    has_many :friend_request_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest


    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
