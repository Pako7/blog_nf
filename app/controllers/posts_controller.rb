class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
