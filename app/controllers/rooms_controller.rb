class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_index_path
  end

  def confirm
    @room = Room.find(params[:id])
  end

  def own_rooms
    @room = Room.find(params[:id])
    @own_room = @room.user_id == current_user.id
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :member ,:total)
  end

end
