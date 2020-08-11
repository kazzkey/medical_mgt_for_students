class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :contact, foreign_key: true
    add_reference :comments, :user_student, foreign_key: true
    add_reference :comments, :user_officer, foreign_key: true
  end
end
