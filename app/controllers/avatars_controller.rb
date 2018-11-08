class AvatarsController < ApplicationController
  before_action :find_avatar, only: [:show, :update, :destroy]

  def index
    @avatars = Avatar.all

    render json: @avatars
  end

  def show
    render json: @avatar
  end

  def create
    if Avatar.find_by name: avatar_params[:name]
      render json: {error: "Name already in use"}
    else
      @avatar = Avatar.new(avatar_params)

      if @avatar.save
        render json: @avatar, status: :created, location: @avatar
      else
        render json: @avatar.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @avatar.update(avatar_params)
      render json: @avatar
    else
      render json: @avatar.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @avatar.destroy
  end

  private
    def find_avatar
      @avatar = Avatar.find(params[:id])
    end

    def avatar_params
      params.permit(:name, :user_id)
    end
end