class Challenge < ApplicationRecord
  belongs_to :avatar
  has_many :messages
end
