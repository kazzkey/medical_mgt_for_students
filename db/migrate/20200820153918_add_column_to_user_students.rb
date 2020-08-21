class AddColumnToUserStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_students, :birth_date, :date
    add_column :user_students, :grade, :integer
    add_column :user_students, :blood_type, :integer
  end
end
