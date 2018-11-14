class ChallengesController < ApplicationController
  def index
      challenges = []

      Challenge.where(:target_id => params[:avatar_id]).or(Challenge.where(:avatar_id => params[:avatar_id])).each do |challenge|
        updatedChallenge = challenge.attributes
        updatedChallenge['messages'] = []
        
        challenge.messages.each_with_index do |message, index|
          updatedMessage = message.attributes
          updatedMessage['speaker'] = Avatar.find(message.avatar_id).name
          
          updatedChallenge['messages'] << updatedMessage
        end
        challenges << updatedChallenge
      end

      render json: challenges
  end

  def create
    if Challenge.find_by(:avatar_id => params[:avatar_id], :target_id => params[:target_id])
      render json: {message: 'Challenge already issued!'}
    else
      challenge = Challenge.new(challenge_params)

      if challenge.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(ChallengeSerializer.new(challenge)).serializable_hash

        ActionCable.server.broadcast 'challenges_channel', serialized_data
        head :ok
      end
    end
    
  end

  private

  def challenge_params
    params.permit(:title, :avatar_id, :target_id)
  end
end