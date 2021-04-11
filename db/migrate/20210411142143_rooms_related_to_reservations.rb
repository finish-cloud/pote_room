class RoomsRelatedToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
    add_column :reservations, :room_image, :string
    add_column :reservations, :room_introduction, :text
  end
end
