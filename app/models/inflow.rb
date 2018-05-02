class Inflow < ApplicationRecord
    has_many :products, through: :inflow_product_quantities
    has_many :inflow_product_quantities

    accepts_nested_attributes_for :inflow_product_quantities
    accepts_nested_attributes_for :products
end
