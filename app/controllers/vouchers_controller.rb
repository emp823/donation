class VouchersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @voucher = Voucher.new()
    @donation = Donation.new()
  end

  def create
    @voucher = Voucher.new(voucher_params)
    if @voucher.save
      redirect_to current_user, notice: "Successfully created voucher!"
    else
      render :new
    end
  end

  def update
    @voucher = voucher.find(params[:id])
    if @voucher.update_attributes(voucher_params)
      redirect_to current_user, notice: "Updated voucher!"
    else
      render :edit
    end
  end

  def edit
    @voucher = voucher.find(params[:id])
  end

  def destroy
    @voucher = voucher.find(params[:id])
    @voucher.destroy
    redirect_to vouchers_url, notice: "Destroyed voucher"
  end

  private

    def voucher_params
      params.require(:voucher).permit(:expiration_date, donation_attributes: [:title, :description, :user_id])
    end
end
