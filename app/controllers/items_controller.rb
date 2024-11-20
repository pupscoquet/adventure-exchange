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

  def new
    @item = Item.new
    @bg_blue = true
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
