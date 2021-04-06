class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.text :address
      t.string :image
      t.datetime :start
      t.datetime :end
      t.integer :user_id

      t.timestamps
    end
  end
end
