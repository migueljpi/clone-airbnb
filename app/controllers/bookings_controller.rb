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
    end
  end

  def accept
    if current_user == @booking.tour.user
      @booking.update(status: "Confirmed")
      flash[:notice] = "Booking has been confirmed."
    else
      flash[:alert] = "You are not authorized to accept this booking."
    end
    redirect_to tour_bookings_path(@booking.tour)
  end

  def reject
    if current_user == @booking.tour.user
      @booking.update(status: "Denied")
      flash[:notice] = "Booking has been denied."
    else
      flash[:alert] = "You are not authorized to reject this booking."
    end
    redirect_to tour_bookings_path(@booking.tour)
  end

  def cancel
  end

  def complete
  end

  def no_show
  end

  def refund
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :pax)
  end
end
