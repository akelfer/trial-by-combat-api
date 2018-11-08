class VotesController < ApplicationController
  before_action :find_vote, only: [:show, :update, :destroy]

  def index
    @votes = Vote.all

    render json: @votes
  end

  def index_by_avatar
    @votes
  end

  def show
    render json: @vote
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vote.update(vote_params)
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vote.destroy
  end

  private
    def find_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.permit(:direction, :content_type, :content_id, :avatar_id)
    end
end