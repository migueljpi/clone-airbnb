class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :language, :guide)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
