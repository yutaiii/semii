class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :title
      t.integer :semianr_id
      t.integer :graduation_id
      t.string :key_words
      t.text :description
      t.text :data
      t.timestamps
    end
  end
end
