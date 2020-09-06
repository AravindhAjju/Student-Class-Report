class AddIndexesOnUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :class_room_id
  end
end
