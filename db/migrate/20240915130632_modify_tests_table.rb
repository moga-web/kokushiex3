class ModifyTestsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :tests, :session, :string
    remove_column :tests, :pass_mark, :integer
  end
end
