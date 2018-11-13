class ChallengesController < ApplicationController
  def index
    challenges = Challenge.where(:target_id => params[:avatar_id]).or(Challenge.where(:avatar_id => params[:avatar_id]))
    

    render json: challenges
  end

  def create
    challenge = Challenge.new(challenge_params)

    if challenge.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(ChallengeSerializer.new(challenge)).serializable_hash

      ActionCable.server.broadcast 'challenges_channel', serialized_data
      head :ok
    end
  end

  private

  def challenge_params
    params.permit(:title, :avatar_id, :target_id)
  end
end