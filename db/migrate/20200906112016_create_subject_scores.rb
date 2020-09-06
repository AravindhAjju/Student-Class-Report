class CreateSubjectScores < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_scores do |t|
      t.integer :score
      t.integer :scorecard_id
      t.string :name
      t.timestamps
    end
  end
end
