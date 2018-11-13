class Message < ApplicationRecord
  belongs_to :challenge
  belongs_to :avatar
end
