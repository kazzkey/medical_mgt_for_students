class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.text :content, null: false
      t.references :user_officer, foreign_key: true

      t.timestamps
    end
  end
end
