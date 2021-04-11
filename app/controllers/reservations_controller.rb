class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @reservation = Reservation.new
    # binding.pry
    @room = Room.find(params[:id])
  end


  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.room = @room
    @reservation.total = @room.price * @reservation.member * (@reservation.end_date.to_date - @reservation.start_date.to_date).to_i
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to reservations_path
    else
      flash[:notice] = "エラーが発生しました、下記ご確認の上、再度お試しください。"
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user, :room,:room_name,:room_image,:room_introduction, :start_date, :end_date, :member, :price)
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end
end
