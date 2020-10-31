class ReservationsController < ApplicationController

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
    @reservation = Reservation.find(params[:id])
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

end
