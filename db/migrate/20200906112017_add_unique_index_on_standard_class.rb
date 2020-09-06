class AddUniqueIndexOnStandardClass < ActiveRecord::Migration[5.2]
  def change
    add_index :class_rooms, :standard, :unique => true
  end
end
