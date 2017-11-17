class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      
    end
    add_index :rooms, :name, unique: true
  end
end