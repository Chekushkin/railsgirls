class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
    current_user.posts.find(params[:id]).destroy!
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
        redirect_to posts_path
    else
        render 'edit'
    end
  end
end