class User < ApplicationRecord
    has_secure_password
    has_many :microposts  , dependent: :destroy
    
    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id", 
                                    dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship",
                                     foreign_key: "followed_id",
                                     dependent: :destroy

    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :friend_request_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
    has_many :friend_request_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest

    def feed
    end

    # Follows a user.
    def follow(other_user)
        following << other_user
    end

    # Unfollows a user.
    def unfollow(other_user)
        following.delete(other_user)
    end

    # Returns true if the current user is following the otheruser.
    def following?(other_user)
        following.include?(other_user)
    end

end
