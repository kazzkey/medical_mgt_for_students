class ChangeStudentCommentsToComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :student_comments, :comments
  end
end
