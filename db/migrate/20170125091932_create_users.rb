class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :faculty_id
      t.integer :department_id
      t.integer :seminar_id
      t.timestamps
    end
  end
end
