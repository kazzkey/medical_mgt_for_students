class ChangeContactsToContactStudents < ActiveRecord::Migration[5.2]
  def change
    rename_table :contacts, :contact_students
  end
end
