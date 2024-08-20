class Api::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_post, only: [:update, :destroy]

  def index
    @user_id = params[:user_id]
    @posts = @user_id ? Post.where(user_id: @user_id) : Post.all

    html_content = render_to_string(
      partial: 'posts/index', formats: [:html], locals: { posts: @posts, user_id: @user_id }
    )
    render json: { html: html_content }
  end

  def show
    @post = Post.find(params[:id])
    html_content = render_to_string(
      partial: 'posts/post', formats: [:html], locals: { post: @post }
    )
    render json: { html: html_content }
  end

  # POST /posts or /posts.json
  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(post_params)
    if @post.save
      render json: {post: @post}
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @post.save
      render json: {post: @post}
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    render json: { message: 'success'}
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end
end
