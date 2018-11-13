class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :title, :avatar_id, :target_id
  has_many :messages
end
