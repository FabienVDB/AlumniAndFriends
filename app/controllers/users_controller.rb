class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
  end

  def index
    @alumnis = User.where(alumni: true)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photos)
  end
end
