class InterestsController < ApplicationController
  def create
  	if current_user.profile.present?
	  	@user = current_user
	  	@post = Post.find(params[:id])
	  	@interest = Interest.new 
	  	@interest.user_id = @user.id
	  	@interest.post_id = @post.id
	  	@interest.save!
	  else
	  	redirect_to profile_path
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
