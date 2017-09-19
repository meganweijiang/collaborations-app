class InterestsController < ApplicationController
  def new
  end

  def create
  	@user = current_user
  	@post = Post.find(params[:id])
  	@interest = Interest.new 
  	@interest.user_id = @user.id
  	@interest.post_id = @post.id
  	if @interest.save!
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def myinterests
  	@interests = current_user.interests.all
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    redirect_to myinterests_path
  end 
end
