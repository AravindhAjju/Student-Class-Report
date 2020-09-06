class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.integer :class_room_id
      t.integer  :identity
      t.timestamps
    end
  end
end
