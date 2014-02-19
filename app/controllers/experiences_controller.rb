class ExperiencesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @experience = Experience.new()
    @donation = Donation.new()
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to current_user, notice: "Successfully created experience!"
    else
      render :new
    end
  end

  def update
    @experience = experience.find(params[:id])
    if @experience.update_attributes(experience_params)
      redirect_to current_user, notice: "Updated experience!"
    else
      render :edit
    end
  end

  def edit
    @experience = experience.find(params[:id])
  end

  def destroy
    @experience = experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_url, notice: "Destroyed experience"
  end

  private

    def experience_params
      params.require(:experience).permit(:latitude, :longitude, :contact_name, donation_attributes: [:title, :description, :user_id])
    end
end
