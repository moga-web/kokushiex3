class CreateTestSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :test_sessions do |t|
      t.references :test, null: false, foreign_key: true
      t.string :session, null: false

      t.timestamps
    end
  end
end
