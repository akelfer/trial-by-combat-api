class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all

    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private
    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.permit(:body, :post_id, :avatar_id)
    end
end
