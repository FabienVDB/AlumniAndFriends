class ReservationsController < ApplicationController
  def index
    # @reservations = Reservation.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
    @next_reservations = @user.reservations.where('date >= ?', DateTime.now)
    @past_reservations = @user.reservations.where('date < ?', DateTime.now)
  end

  def create
    @reservation = Reservation.new(client: current_user,
                                   provider: User.find(params[:user_id]),
                                   date: params['reservation']['date'])
    if @reservation.save
      redirect_to user_reservations_path(@reservation.client)
    else
      redirect_to user_path(@reservation.provider)
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to user_reservations_path(@reservation.client)
  end
end
