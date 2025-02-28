class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tour = Tour.find(params[:tour_id])
    @booking.user = current_user
    if @booking.save
      redirect_to root_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
