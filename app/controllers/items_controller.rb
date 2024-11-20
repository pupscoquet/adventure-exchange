class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params[:item_name].present?
      @items = @items.where("name ILIKE ?", "%#{params[:item_name]}%")
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
end
