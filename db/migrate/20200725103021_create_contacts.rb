class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.references :user_student, foreign_key: true
      t.references :user_officer, foreign_key: true

      t.timestamps
    end
  end
end
