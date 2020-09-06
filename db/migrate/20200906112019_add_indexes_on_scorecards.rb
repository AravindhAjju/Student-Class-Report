class AddIndexesOnScorecards < ActiveRecord::Migration[5.2]
  def change
    add_index :scorecards, :student_id, unique: true
  end
end
