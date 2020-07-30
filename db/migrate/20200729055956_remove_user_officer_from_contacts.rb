class RemoveUserOfficerFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contacts, :user_officer, foreign_key: true
  end
end
