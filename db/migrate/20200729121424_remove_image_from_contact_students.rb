class RemoveImageFromContactStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contact_students, :image, :string
  end
end
