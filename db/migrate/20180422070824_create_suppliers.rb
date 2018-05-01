class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.text :sname
      t.text :saddress
      t.text :scontactn
      t.text :scontactp
      t.text :spayment
      t.text :snotes

      t.timestamps
    end
  end
end
