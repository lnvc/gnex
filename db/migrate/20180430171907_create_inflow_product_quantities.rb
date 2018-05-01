class CreateInflowProductQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :inflow_product_quantities do |t|
      t.references :inflow, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :iquantity

      t.timestamps
    end
  end
end
