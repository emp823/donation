class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @donations = @user.donations.all
    experiences = @user.donations.where(donatable_type: "Experience").map { |donation| donation.donatable }
    @hash = Gmaps4rails.build_markers(experiences) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
    end
  end
end
