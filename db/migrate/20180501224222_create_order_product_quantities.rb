class CreateOrderProductQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :order_product_quantities do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :oquantity

      t.timestamps
    end
  end
end
