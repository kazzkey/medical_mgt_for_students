class DropContactOfficer < ActiveRecord::Migration[5.2]
  def change
    drop_table :contact_officers
  end
end
