class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :examination, null: false, foreign_key: true
      t.integer :total_score, null: false
      t.integer :common_score, null: false
      t.integer :practical_score, null: false

      t.timestamps
    end
  end
end
