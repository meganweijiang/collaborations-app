class ProfilesController < ApplicationController

  def show
    @city = request.location.city
    if Profile.where(:user_id => current_user.id).present?
      @profile = Profile.find_by(user_id: current_user.id)   
    else 
    	render 'new'
    end
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def new
   	@profile = Profile.new
  end 

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path
    else
      render 'new'
    end
  end 

  private 
    def profile_params
      params.require(:profile).permit(:location, :skills, :bio, :image)
    end 
end
