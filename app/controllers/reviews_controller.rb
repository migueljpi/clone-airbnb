class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @user = current_user
    @bookings_reviewed = Booking.where(user_id: @user.id)
    @reviews_user = Review.where(booking_id: @bookings_reviewed.pluck(:id))

    # @reviews_guide = Review.joins(booking: :tour).where(tours: { user_id: @user.id })
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.booking.user = current_user
    if @review.save
      @review.booking.tour.update_tour_avg_rating
      redirect_to user_path(current_user)
      flash[:notice] = "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_reviews_path(current_user), notice: "Review was successfully deleted."
  end

  private

  def review_params
    params.require(:review).permit(:review_content, :tour_rating, :guide_rating)
  end
end
