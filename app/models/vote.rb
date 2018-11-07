class Vote < ApplicationRecord
  belongs_to :content, polymorphic: true
  belongs_to :avatar
end
