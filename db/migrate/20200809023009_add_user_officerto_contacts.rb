class AddUserOfficertoContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :user_officer, foreign_key: true
  end
end
