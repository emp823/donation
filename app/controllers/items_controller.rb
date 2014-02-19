class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @item = Item.new()
    @donation = Donation.new()
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to current_user, notice: "Successfully created item!"
    else
      render :new
    end
  end

  def update
    @item = item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to current_user, notice: "Updated item!"
    else
      render :edit
    end
  end

  def edit
    @item = item.find(params[:id])
  end

  def destroy
    @item = item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: "Destroyed item"
  end

  private

    def item_params
      params.require(:item).permit(:height, :width, :weight, donation_attributes: [:title, :description, :user_id])
    end
end
