class PostsController < ApplicationController

  before_action :require_user, only: [:show, :home, :new, :create]

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
    @post.user_id = current_user.id 
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
