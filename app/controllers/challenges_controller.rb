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

  def update
    challenge = Challenge.find(params[:id])

    challenge.update(challenge_params)

    if challenge.avatar_throw and challenge.target_throw
      winner_id = calculate_winner(challenge.avatar_id, challenge.avatar_throw, challenge.target_id, challenge.target_throw)

      render json: {winner: Avatar.find(winner_id)}
    else
      render json: challenge
    end
  end

  def destroy
    challenge = Challenge.find(params[:id])
    
    if challenge.destroy
      render json: {message: 'Challenge has been destroyed'}
    end
  end

  private

  def challenge_params
    params.permit(:title, :avatar_id, :target_id, :avatar_throw, :target_throw)
  end

  def calculate_winner(avatar_id, avatar_throw, target_id, target_throw)
    if avatar_throw == target_throw
      return 1
    elsif avatar_throw == 'Rock'
      if target_throw == 'Paper'
        return target_id
      elsif target_throw == 'Scissors'
        return avatar_id
      end
    elsif avatar_throw == 'Paper'
      if target_throw == 'Rock'
        return avatar_id
      elsif target_throw == 'Scissors'
        return target_id
      end
    elsif avatar_throw == 'Scissors'
      if target_throw == 'Rock'
        return target_id
      elsif target_throw == 'Paper'
        return avatar_id
      end
    end
  end
end