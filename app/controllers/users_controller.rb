class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @bookings = Booking.joins(:tour).where(tours: { user_id: @user.id }).order(updated_at: :desc).to_a
    Rails.logger.debug "Bookings loaded for guide: #{@bookings.pluck(:id, :status)}"
    @tours = Tour.where(user_id: @user.id).order(updated_at: :desc).to_a

    @reviews_guide = Review.joins(booking: :tour).where(tours: { user_id: @user.id })
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :language, :guide, :about_me, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
