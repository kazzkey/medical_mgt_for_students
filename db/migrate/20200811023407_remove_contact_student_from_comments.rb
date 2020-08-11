class RemoveContactStudentFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comments, :contact_student
  end
end
