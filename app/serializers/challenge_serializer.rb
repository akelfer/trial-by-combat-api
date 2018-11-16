class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :title, :avatar_id, :target_id, :avatar_throw, :target_throw
  has_many :messages
end