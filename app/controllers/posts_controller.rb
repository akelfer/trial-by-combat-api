class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    @posts = []
    
    Post.order('created_at DESC').each do |post|
      postData = {
        id: post.id,
        title: post.title,
        body: post.body,
        created_at: post.created_at,
        author: post.avatar.name,
        author_rep: post.avatar.reputation,
        score: post.votes.sum(:direction)
      }

      @posts << postData
    end

    render json: @posts
  end

  def show
    @comments = []
    
    @post.comments.order('created_at DESC').each do |comment|
      commentData = {
        id: comment.id,
        body: comment.body,
        created_at: comment.created_at,
        author: comment.avatar.name,
        author_rep: comment.avatar.reputation,
        score: comment.votes.sum(:direction)
      }

      @comments << commentData
    end

    render json: {post: @post, comments: @comments}
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:title, :body, :avatar_id)
    end
end
