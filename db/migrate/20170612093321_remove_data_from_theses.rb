class RemoveDataFromTheses < ActiveRecord::Migration
  def change
    remove_column :theses, :data, :string
  end
end
