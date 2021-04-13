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

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:id])
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      people = Date.parse(reservation_params[:member])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room_id = @room.id
      @reservation.room_name = @room.name
      @reservation.room_image = @room.image
      @reservation.room_introduction = @room.introduction
      render :confirm if @reservation.invalid?
      @reservation.price = @room.price
      @reservation.total = @room.price * days * people
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
    params.require(:reservation).permit(:user, :room,:room_name,:room_image,:room_introduction, :start_day, :end_day, :member ,:price)
  end

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end
end
