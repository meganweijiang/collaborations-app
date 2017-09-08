class PostsController < ApplicationController

  before_action :require_user, only: [:show, :home]

  def home
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
 	  @post = Post.new 
  end
  
  def create 
    @post = Post.new(post_params) 
    @post.author = current_user.email
    @post.first_name = current_user.first_name
    @post.last_name = current_user.last_name
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
