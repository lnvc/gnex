# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.count == 0
   User.create!([{ id: 1, email: 'admin@gmail.com', password: 'GnexGue54321<3' }]) 
end

Supplier.create! ([{ supplier_id: 1, sname: 'Philflex Wire & Cable Co', saddress: '417 Quezon Avenue Quezon City', scontactn: 7404541, scontactp: 'Linda', spayment: '90 days to pay'}])
Supplier.create! ([{ supplier_id: 2, sname: 'Armak Electrical Tape', saddress: '736 Vitales Street Malibay Pasay', scontactn: 8510212, scontactp: 'Steven', spayment: '60 days to pay'}])
Supplier.create! ([{ supplier_id: 3, sname: 'Belden Global Cables', saddress: 'One Global Place 25th street Taguig', scontactn: 2242029, scontactp: 'John', spayment: '60 days to pay'}])
Supplier.create! ([{ supplier_id: 4, sname: 'Columbia Wires and Cables', saddress: '75 Howmart Road Quezon City', scontactn: 4253011, scontactp: 'Benjie', spayment: 'COD'}])

Customer.create! ([{ id: 1, cname: 'AP Trading', caddress: '47 Silencio Street Quezon City', ccontactn: 9498629, ccontactp: 'Carina', cpayment: '60 days to pay' }])
Customer.create! ([{ id: 2, cname: 'Gigalight Trading', caddress: '27 Landargon Street Quezon City', ccontactn: 7165452, ccontactp: 'Wilson', cpayment: 'COD', cnotes: 'no cash cheques' }])
Customer.create! ([{ id: 3, cname: 'QC Multisales', caddress: '181 Wayan Street Masambong', ccontactn: 5465828, ccontactp: 'Lester', cpayment: '90 days to Pay', cnotes: 'Delivery always to brown gate' }])
Customer.create! ([{ id: 4, cname: 'Proton Summit', caddress: '39 Ambrocia Novaliches', ccontactn: 3674829, ccontactp: 'Marie', cpayment: '60 days to pay' }])
Customer.create! ([{ id: 5, cname: 'JF Forge', caddress: '97 KM32 West Service Road Paranaque', ccontactn: 7324851, ccontactp: 'N/A', cpayment: '60 days to pay' }])

Product.create! ([{ id: 1, supplier_id: 1, pname: 'Philflex 12/7 THHN Stranded', price: '8,400', unit: 'Cartons', reorder: 500, loc: 'A', currquantity: 500, status: 'available' }])
Product.create! ([{ id: 2, supplier_id: 2, pname: 'Armak Rubber Tape', price: '2,700', unit: 'Cartons', reorder: 300, loc: 'B', currquantity: 1200, status: 'available' }])
Product.create! ([{ id: 3, supplier_id: 3, pname: 'Belden Cat 6', price: '4,200', unit: 'Rolls', reorder: 200, loc: 'A', currquantity: 1000, status: 'available' }])
Product.create! ([{ id: 4, supplier_id: 1, pname: 'Philflex 10/7 Solid Wire', price: '14,000', unit: 'Cartons', reorder: 1000, loc: 'A', currquantity: 3000, status: 'available' }])
Product.create! ([{ id: 5, supplier_id: 4, pname: 'Columbia RG6 Cable', price: '2,200', unit: 'Cartons', reorder: 200, loc: 'A', currquantity: 100, status: 'available' }])
Product.create! ([{ id: 6, supplier_id: 2, pname: 'Armak Masking Tape 1/2”', price: '2,100', unit: 'Cartons', reorder: 200, loc: 'B', currquantity: 1000, status: 'available' }])
Product.create! ([{ id: 7, supplier_id: 2, pname: 'Armak Electrical Tape Assorted', price: '2,100', unit: 'Cartons', reorder: 200, loc: 'B', currquantity: 500, status: 'available' }])
Product.create! ([{ id: 8, supplier_id: 2, pname: 'Armak Rubber Wire Coating', price: '150', unit: 'Cartons', reorder: 150, loc: 'B', currquantity: 200, status: 'available' }])
