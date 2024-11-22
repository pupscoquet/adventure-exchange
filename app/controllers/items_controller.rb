class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @items = Item.all
    if params[:item_name].present?
      @items = @items.where("name ILIKE :item_name OR description ILIKE :item_name", item_name: "%#{params[:item_name]}%")
    end

    location = params[:item_location]
    if params[:item_location].present?
      @items = @items.near(location, 200)
    end

    # if params[:item_location] && params[:item_location] != ""
    #   @items = @items.where(params[:item_location])
    # end

    # if params[:item_dates] && params[:item_dates] != ""
    #   @items = @items.where(params[:item_dates])
    # end
  end

  def search
    @bg_red = true
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @bg_blue = true
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    redirect_to items_path
  end

  def my_items
    @items = current_user.items
    @user = current_user
    #get all the items from the current user
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to my_items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :location, :price_per_day, :photo)
  end
end
