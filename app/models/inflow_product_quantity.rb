class InflowProductQuantity < ApplicationRecord
  belongs_to :inflow
  belongs_to :product
end
