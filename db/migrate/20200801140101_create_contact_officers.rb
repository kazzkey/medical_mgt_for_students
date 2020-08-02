class CreateContactOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_officers do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :user_officer, foreign_key: true

      t.timestamps
    end
  end
end
