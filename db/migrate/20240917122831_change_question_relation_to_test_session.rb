class ChangeQuestionRelationToTestSession < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :test, foreign_key: true

    add_reference :questions, :test_session, foreign_key: true, null: false
  end
end
