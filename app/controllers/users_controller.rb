class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @donations = @user.donations.all
  end
end
