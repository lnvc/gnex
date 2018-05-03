class AddReceiptToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_column :outflows, :receipt, :string
  end
end
