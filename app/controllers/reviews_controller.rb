class ReviewsController < ApplicationController
  def create
    comment = params[:review][:comment]
    rating = params[:review][:rating]
    reservation = Reservation.find(params[:reservation_id])
    client = User.find(params[:user_id])
    @review = Review.new(user: client, reservation: reservation, comment: comment, rating: rating)
    if @review.save
      redirect_to user_path(reservation.provider)
    else
      redirect_to user_reservations_path(current_user)
    end
  end
end
