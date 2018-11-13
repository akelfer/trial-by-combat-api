class ChallengesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "challenges_channel"
  end

  def unsubscribed
  end
end
