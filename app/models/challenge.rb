class Challenge < ApplicationRecord
  belongs_to :avatar
  has_many :messages, :dependent => :delete_all
end
