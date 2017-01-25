class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.integer :department_id
      t.timestamps
    end
  end
end
