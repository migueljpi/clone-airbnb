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

  def accept
    @booking = Booking.find(params[:id])
    if current_user == @booking.tour.user
      @booking.update(status: "Confirmed")
      if @booking.save
        flash[:notice] = "Booking has been confirmed."
      else
        flash[:alert] = "Failed to confirm booking."
      end
    else
      flash[:alert] = "You are not authorized to accept this booking."
    end
    redirect_to user_path(current_user)
  end

  def reject
    @booking = Booking.find(params[:id])
    if current_user == @booking.tour.user
      @booking.update(status: "Denied")
      if @booking.save
        flash[:notice] = "Booking has been denied."
      else
        flash[:notice] = "Failed to deny booking."
      end
    else
      flash[:notice] = "You are not authorized to reject this booking."
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

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :pax, :status)
  end
end
