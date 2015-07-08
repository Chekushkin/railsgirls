class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    binding.pry
    @post.user = current_user
    @post.save
    if @post.valid?
      redirect_to posts_path
    else
      render(:new)
    end
  end

  def post_params
    params.require(:post).permit!
  end

  def destroy
    Post.find(params[:id]).destroy!
    redirect_to posts_path
  end
end