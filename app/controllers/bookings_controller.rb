class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(tour_id: params[:tour_id])
  end

  def new
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tour = Tour.find(params[:tour_id])
    @booking.tour = @tour
    @booking.user = current_user
    if @booking.save
      redirect_to root_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
      p @booking.errors
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pax)
  end
end
