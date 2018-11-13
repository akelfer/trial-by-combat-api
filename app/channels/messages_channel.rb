class MessagesChannel < ApplicationCable::Channel
  def subscribed
    challenge = Challenge.find(params[:challenge])
    stream_for challenge
  end

  def unsubscribed
  end
end
