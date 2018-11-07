class Post < ApplicationRecord
  has_many :votes, as: :content
  has_many :comments
  belongs_to :avatar
end
