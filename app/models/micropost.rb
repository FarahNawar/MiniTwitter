class Micropost < ApplicationRecord
    belongs_to :user
    validates :content, length: { maximum: 150 }, presence: true
end
