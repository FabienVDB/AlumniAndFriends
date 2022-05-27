class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_user, only: %i[show]

  def show
    @reservation = Reservation.new
    @reviews = Reservation.where(provider: @user).map(&:reviews).flatten
  end

  def index
    if params[:provider].present?
      @users = User.search_by_first_name(params[:provider])
    else
      @users = User.all
    end

    if params[:location].present?
      @users = User.near(params[:location])
    else
      @users = User.all
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
