class ReviewsController < ApplicationController
  def new
    # raise
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    # @trainer = Trainer.find(params[:id])
    # @pokeball = @trainer.pokeballs
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.booking.user = current_user
    if @review.save
      redirect_to user_path(current_user)
      flash[:notice] = "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    # @booking = Booking.new(booking_params)
    # @tour = Tour.find(params[:tour_id])
    # @booking.tour = @tour
    # @booking.user = current_user
    # if @booking.save
    #   redirect_to user_path(current_user)
    #   flash[:notice] = "Booking was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def review_params
    params.require(:review).permit(:review_content, :tour_rating, :guide_rating)
  end

  # def booking_params
  #   params.require(:booking).permit(:date, :pax, :status)
  # end
end
