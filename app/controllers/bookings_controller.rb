class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = @user.bookings.new(booking_params)

    if @booking.save
      redirect_to user_bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:format])
  end

  def confirm
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.Success!
    redirect_to bookings_path, status: 303
  end

  def cancel
    @booking = Booking.find_by(id: params[:booking_id])
    @booking.Failed!
    redirect_to bookings_path, status: 303
  end

  def update
    @booking = Booking.find(params[:format])
    if @booking.update([:status])
      redirect_to user_bookings_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :event_id, :capacity, :status, :reason)
  end
end
