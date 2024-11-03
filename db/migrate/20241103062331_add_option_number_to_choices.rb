class AddOptionNumberToChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :choices, :option_number, :integer, null: false
  end
end
