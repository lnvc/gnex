class AddCustomerRefToOutflows < ActiveRecord::Migration[5.2]
  def change
    add_reference :outflows, :customer, foreign_key: true
  end
end
