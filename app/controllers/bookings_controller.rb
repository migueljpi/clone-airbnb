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
      redirect_to user_path(current_user), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @tour = @booking.tour
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to user_path(current_user), notice: "Booking was successfully updated."
      p "THIS HAS WORKED"
    else
      render :edit, status: :unprocessable_entity
      p "THESE ARE THE ERRORS"
      p @booking.errors.full_messages
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user), notice: "Booking was successfully destroyed."
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pax)
  end
end
