class DonationsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @donation = Donation.new()
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.user_id = current_user.id
    if @donation.save
      redirect_to @donation, notice: "Successfully created donation!"
    else
      render :new
    end
  end

  def update
    @donation = Donation.find(params[:id])
    if @donation.update_attributes(donation_params)
      redirect_to current_user, notice: "Updated donation!"
    else
      render :edit
    end
  end

  def edit
    @donation = donation.find(params[:id])
  end

  def destroy
    @donation = donation.find(params[:id])
    @donation.destroy
    redirect_to donations_url, notice: "Destroyed donation"
  end

  def show
  end

  private

    def donation_params
      params.require(:donation).permit(:id, :title, :description, :user_id, :donatable_id, :donatable_type)
    end
end
