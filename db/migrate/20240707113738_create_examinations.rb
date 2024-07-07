class CreateExaminations < ActiveRecord::Migration[7.0]
  def change
    create_table :examinations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.datetime :attempt_date, null: false

      t.timestamps
    end
  end
end
