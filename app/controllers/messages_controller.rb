class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    challenge = Challenge.find(message_params[:challenge_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to challenge, serialized_data
      head :ok
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:text, :challenge_id, :avatar_id)
  end
end