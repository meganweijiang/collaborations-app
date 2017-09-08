class PostsController < ApplicationController

  before_action :require_user, only: [:show]

  def show
    @posts = Post.all
  end

  def new 
 	  @post = Post.new 
  end
  
  def create 
    @post = Post.new(post_params) 
    @post.author = current_user.email
    if @post.save 
      redirect_to posts_path
    else 
      render 'new' 
    end 
  end
  
  private 
	  def post_params 
      params.require(:post).permit(:title, :location, :description, :requirements) 
    end
end
