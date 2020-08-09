class CreateStudentComments < ActiveRecord::Migration[5.2]
  def change
    create_table :student_comments do |t|
      t.references :contact_student, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
