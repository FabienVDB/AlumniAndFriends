class ReservationsController < ApplicationController
  def index
    # @reservations = Reservation.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
  end
end
