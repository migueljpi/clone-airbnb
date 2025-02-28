class ToursController < ApplicationController
  def index
    @tours = Tour.all
    @user = current_user
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
