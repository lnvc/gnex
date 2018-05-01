class CreateInflows < ActiveRecord::Migration[5.2]
  def change
    create_table :inflows do |t|
      t.string :sreceipt
      t.date :entrydate
      t.integer :cost

      t.timestamps
    end
  end
end
