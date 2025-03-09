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

    @markers = []

    # Add starting point marker
    @markers << { lat: @tour.latitude, lng: @tour.longitude, label: 'Start' }

    # Add ending point marker
    ending_point_coords = Geocoder.coordinates(@tour.ending_point)
    @markers << { lat: ending_point_coords[0], lng: ending_point_coords[1], label: 'End' } if ending_point_coords

    # Add sightseeing spots markers
    return unless @tour.sights.present?

    @tour.sights.split('; ').each do |sight|
      sight_coords = Geocoder.coordinates(sight)
      @markers << { lat: sight_coords[0], lng: sight_coords[1], label: sight } if sight_coords
    end
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
    params.require(:tour).permit(:name, :location, :description, :duration_in_hours, :price, :category, :photo,
                                 :starting_point, :ending_point, :sights)
  end
end
