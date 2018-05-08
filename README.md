sudo service mysql start - start mysql

remove all entries in database:
1. rake db:drop:all 
2. rake db:create:all
3. rake db:migrate
4. mysql -u root -p
5. use sad_gnex_commercial_development;
6. mysql statements:
show create table products; ***
ALTER TABLE products DROP FOREIGN KEY <CONSTRAINT NAME FROM *** >;
ALTER TABLE products DROP KEY <KEY NAME FROM *** >;
ALTER TABLE suppliers CHANGE id supplier_id integer(3) auto_increment;
ALTER TABLE products MODIFY supplier_id integer(3) NOT NULL;
ALTER TABLE products ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);