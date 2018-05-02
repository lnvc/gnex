class Order < ApplicationRecord
  has_many :products, through: :order_product_quantities
  has_many :order_product_quantities
  belongs_to :customer

  accepts_nested_attributes_for :order_product_quantities
  accepts_nested_attributes_for :products
end
