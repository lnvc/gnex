class Outflow < ApplicationRecord
    has_many :products, through: :outflow_product_quantities
    has_many :outflow_product_quantities

    accepts_nested_attributes_for :outflow_product_quantities
    accepts_nested_attributes_for :products
end
