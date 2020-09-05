class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.float :height
      t.float :body_weight
      t.float :sitting_height
      t.float :naked_eyesight
      t.float :corrected_eyesight
      t.integer :hearing, defalut: 0
      t.integer :urine, defalut: 0
      t.integer :electro_cardiogram, defalut: 0
      t.integer :nutritional_status, defalut: 0
      t.timestamps
    end
  end
end
