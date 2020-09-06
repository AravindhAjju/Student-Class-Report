class AddUniqueIndexOnUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :identity, unique: true
  end
end
