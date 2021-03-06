class PostsController < ApplicationController

  before_action :require_user

  def home
    @posts = if params[:term]
      Post.where('title LIKE ? or location LIKE ? or description LIKE ? or requirements LIKE ? or category LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%", "%#{params[:term]}%").order('id DESC')
    else
      @posts = Post.all.order('id DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if Interest.find_by(post_id: @post.id).present?
      @interests = Interest.where(post_id: @post.id).all
      for interest in @interests do
        interest.destroy
      end
    end
    @post.destroy
    redirect_to posts_path
  end 

  def decline
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to sharedwithme_path
  end 

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end 
  end

  def new 
    if Profile.where(:user_id => current_user.id).present?
      @post = Post.new 
    else 
      redirect_to profile_path
    end
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

  def myposts
    @posts = current_user.posts.all
  end

  def sharedwithme
    @posts = current_user.posts.all
    @interests = Interest.where(post_id: @posts.ids).all  
    for interest in @interests do
      puts interest.id
      interest.update_attributes(:seen => true)
      interest.save
    end
  end
  
  private 
	  def post_params 
      params.require(:post).permit(:title, :location, :description, :requirements, :category, :term) 
    end
end
