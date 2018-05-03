class AddReceiptToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :receipt, :string
  end
end
