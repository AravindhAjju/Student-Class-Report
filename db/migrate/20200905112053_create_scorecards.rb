class CreateScorecards < ActiveRecord::Migration[5.2]
  def change
    create_table :scorecards do |t|
      t.string :grade
      t.integer :student_id
      t.integer :total
      t.timestamps
    end
  end
end
