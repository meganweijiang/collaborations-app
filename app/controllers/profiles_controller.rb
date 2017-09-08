class ProfilesController < ApplicationController
  def show
    begin
      @profile ||= Profile.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
    	render 'new'
    end
  end

  def new
   	@profile = Profile.new
  end 

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path
    else
      render 'new'
    end
  end 

  private 
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :location, :skills, :bio)
    end 
end
