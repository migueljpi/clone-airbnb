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
      redirect_to user_path(current_user)
      flash[:notice] = "Booking was successfully created."
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
        flash[:notice] = "Failed to confirm booking."
      end
    else
      flash[:notice] = "You are not authorized to accept this booking."
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
    @booking = Booking.find(params[:id])
    if current_user == @booking.user
      @booking.update(status: "Cancelled")
      if @booking.save
        flash[:notice] = "Booking has been cancelled."
      else
        flash[:notice] = "Failed to cancel booking."
      end
    else
      flash[:notice] = "You are not authorized to cancel this booking."
    end
    redirect_to user_path(current_user)
  end

  def complete
    @booking = Booking.find(params[:id])
    if current_user == @booking.user
      @booking.update(status: "Completed")
      if @booking.save
        flash[:notice] = "Booking has been completed."
      else
        flash[:notice] = "Failed to complete booking."
      end
    else
      flash[:notice] = "You are not authorized to complete this booking."
    end
    redirect_to user_path(current_user)
  end

  def no_show
    @booking = Booking.find(params[:id])
    if current_user == @booking.tour.user
      @booking.update(status: "No Show")
      if @booking.save
        flash[:notice] = "Booking has been marked as No Show."
      else
        flash[:notice] = "Failed to mark booking as No Show."
      end
    else
      flash[:notice] = "You are not authorized to mark this booking as No Show."
    end
    redirect_to user_path(current_user)
  end

  def refund
    @booking = Booking.find(params[:id])
    if current_user == @booking.tour.user
      @booking.update(status: "Refunded")
      if @booking.save
        flash[:notice] = "Booking has been refunded."
      else
        flash[:notice] = "Failed to refund booking."
      end
    else
      flash[:notice] = "You are not authorized to refund this booking."
    end
    redirect_to user_path(current_user)
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
