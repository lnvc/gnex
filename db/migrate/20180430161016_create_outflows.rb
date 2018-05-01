class CreateOutflows < ActiveRecord::Migration[5.2]
  def change
    create_table :outflows do |t|
      t.integer :creceipt
      t.date :exitdate

      t.timestamps
    end
  end
end
