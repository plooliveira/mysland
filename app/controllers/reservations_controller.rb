class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :payment]
  # reservation.status:
  # 0 = pending payment
  # 1 = payment done, pending approval by host
  # 2 = approved by host

  def create
    # TO DO
    @reservation = Reservation.new(reservation_params)
    @island = Island.find(params[:island_id])
    @reservation.island = @island
    @reservation.status = 0
    @reservation.user = current_user
    @reservation.save
    redirect_to payment_path(@reservation)
  end

  def payment
  end

  def payment_ok
    @reservation = Reservation.find(params[:id])
    @reservation.status = 1
    @reservation.save
    redirect_to reservation_path(@reservation)
  end


  def index
    @reservations = Reservation.all
  end

  def show
    # TO DO
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
