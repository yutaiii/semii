class AddThesisDataToTheses < ActiveRecord::Migration
  def change
    add_column :theses, :thesis_data, :binary
  end
end
