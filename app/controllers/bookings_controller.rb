class BookingsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @booking = Booking.new(@item)
    @item = Item.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    date = params[:booking][:start_date]
    all_dates = date.split(" to ")
    @booking.start_date = all_dates[0]
    @booking.end_date = all_dates[1]
    @booking.user = current_user
    @booking.item = Item.find(params[:id])

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
    params.require(:booking).permit(:price)
  end
end
