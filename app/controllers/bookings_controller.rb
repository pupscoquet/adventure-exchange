class BookingsController < ApplicationController
  def new
    @booking = Booking.new(@item)
    @item = Item.find(params[:id])
  end
end
