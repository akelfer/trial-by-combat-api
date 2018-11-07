class Avatar < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :comments
  has_many :votes
end
