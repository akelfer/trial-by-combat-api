class Comment < ApplicationRecord
  belongs_to :avatar
  belongs_to :post
  has_many :votes, as: :content
end
