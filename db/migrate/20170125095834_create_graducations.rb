class CreateGraducations < ActiveRecord::Migration
  def change
    create_table :graducations do |t|
      t.string :year
      t.timestamps
    end
  end
end
