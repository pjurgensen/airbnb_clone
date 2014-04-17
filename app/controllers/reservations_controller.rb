class ReservationsController < ApplicationController
  before_filter :find_reservation, only: [:show, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      # UserMailer.reservations_created(current_user, @reservation).deliver
      flash[:notice] = "Your reservation was created successfully!"
      redirect_to rentals_path
    else
      flash[:alert] = "Your reservation was not saved - please try again"
      render 'new'
    end
  end

  def destroy
    @reservation.destroy
    redirect_to user_path(current_user)
  end

private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :rental_id)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
