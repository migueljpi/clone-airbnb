class ToursController < ApplicationController
  def index
    @tours = Tour.all
    # the 'geocoded' scope filters only tours with coordinates (latitude and longitude)
    @user = current_user
    @users = User.all

    return unless params[:search].present?

    # @tours = @tours.where("name LIKE ?", "%#{params[:search]}%")
    @tours = Tour.search_by_name_and_location_and_description_and_starting_point_and_ending_point_and_sites_and_category(params[:search])
  end

  def show
    @tour = Tour.find(params[:id])
    @user = current_user
    @booking = Booking.new(date: Date.today)
    @booking.user = current_user

    @markers = [
      { lat: @tour.starting_point_latitude, lng: @tour.starting_point_longitude },
      { lat: @tour.ending_point_latitude, lng: @tour.ending_point_longitude }
    ]
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new, unprocessable_entity
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :location, :description, :duration_in_hours, :price, :category, :photo)
  end
end
