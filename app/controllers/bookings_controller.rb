class BookingsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @booking = Booking.new(@item)
    @item = Item.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to dashboard_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(@booking.user), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :price)
  end
end
