class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def dashboard
    @user = User.find(params[:id])
    @bookings = Booking.where(user: @user)
    @items = @user.items # same as where method above

    # @rented_items = @user.is_owner?.includes(:item)
  end
end
