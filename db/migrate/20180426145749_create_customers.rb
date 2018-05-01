class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :cname
      t.string :caddress
      t.string :ccontactn
      t.string :ccontactp
      t.string :cpayment
      t.string :cnotes

      t.timestamps
    end
  end
end
