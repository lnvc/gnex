class RemindersController < ApplicationController
  def index
    # loop through orders, find with status = 1, find orderlines with oquantity != 0, display
    @orders = Order.all
    # @orderlines = Order.order_product_quantities.where(":oquantity > 0")
  end
end
