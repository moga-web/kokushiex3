class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :year, null: false
      t.string :session, null: false
      t.integer :pass_mark, null: false

      t.timestamps
    end
  end
end
