class BookingsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @booking = Booking.new(@item)
    @item = Item.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(@booking.user), status: :see_other
  end
end
