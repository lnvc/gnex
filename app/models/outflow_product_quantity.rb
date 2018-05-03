class OutflowProductQuantity < ApplicationRecord
  belongs_to :outflow
  belongs_to :product
end
