class AddReleaseToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :release, :boolean, null: false, default: false
  end
end
