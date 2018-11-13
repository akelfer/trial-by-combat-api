class MessageSerializer < ActiveModel::Serializer
  attributes :id, :avatar_id, :challenge_id, :text, :created_at
end
