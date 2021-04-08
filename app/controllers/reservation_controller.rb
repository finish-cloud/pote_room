class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:alert] = "自分の宿には予約できません"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      people = Date.parse(reservation_params[:member])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room = room
      @reservation.price = room.price
      @reservation.total = room.price * days * people
      @reservation.save

      flash[:notice] = "予約完了"
    end
    redirect_to room
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
