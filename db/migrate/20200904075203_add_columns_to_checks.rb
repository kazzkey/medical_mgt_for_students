class AddColumnsToChecks < ActiveRecord::Migration[5.2]
  def change
    add_reference :checks, :user_student, foreign_key: true
    add_reference :checks, :user_officer, foreign_key: true
  end
end
