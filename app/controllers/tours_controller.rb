class ToursController < ApplicationController
  def index
    @tours = Tour.all
    @user = current_user
    @users = User.all

    if params[:search].present?
      @tours = @tours.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :location, :description, :duration_in_hours, :price, :category, :photo)
  end
end
