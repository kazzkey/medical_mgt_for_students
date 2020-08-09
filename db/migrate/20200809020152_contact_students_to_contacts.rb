class ContactStudentsToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_table :contact_students, :contacts
  end
end
