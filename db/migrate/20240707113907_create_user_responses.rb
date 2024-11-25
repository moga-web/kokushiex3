class CreateUserResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_responses do |t|
      t.references :examination, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
