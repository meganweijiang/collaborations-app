class ProfilesController < ApplicationController
  def show
    begin
      @profile ||= Profile.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
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
      params.require(:profile).permit(:location, :skills, :bio)
    end 
end
