class Supplier < ApplicationRecord
    # belongs_to :product
    has_many :products
end
