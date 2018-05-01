class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :pname
      t.string :price
      t.string :unit
      t.integer :reorder
      t.string :loc
      t.integer :currquantity
      t.string :status
      t.timestamps
    end
  end
end
