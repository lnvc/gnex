class AddCostToInflowProductQuantities < ActiveRecord::Migration[5.2]
  def change
    add_column :inflow_product_quantities, :cost, :integer
  end
end
