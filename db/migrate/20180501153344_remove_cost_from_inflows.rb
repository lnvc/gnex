class RemoveCostFromInflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :inflows, :cost, :integer
  end
end
