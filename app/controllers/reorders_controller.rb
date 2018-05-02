class ReordersController < ApplicationController
  def index
    @products = Product.where("currquantity <= reorder")
    # @supplier = Supplier.where()
  end
end
