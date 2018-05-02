class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    # initialize
    @order.total = 0
    @order.status = 0
    # check each line's product's quantity
    @order_line = @order.order_product_quantities
    @order_line.each do |product| 
      # add each to total
      @order.total += product.oquantity
      # check if product.currquantity - quan < 0, if < 0 , incomplete orders list
      @product = Product.find_by(id: product.product_id)
      if @product.currquantity - product.oquantity < 0
        # 0 = complete, 1 = incomplete
        @order.status = 1 
        # needed quantity to complete order
        product.oquantity -= @product.currquantity
        @product.currquantity = 0
      # product.save
      else
        @product.currquantity -= product.oquantity
        product.oquantity = 0
      end
      @product.save
    end
    
    if @order.save
      redirect_to orders_new_path, notice: "Order successfully added."
    else
      render :new
    end
  end
  
  # def orderavailability
  #   # loop through orders, find with status = 1, find orderlines with oquantity != 0, display
  #   @orders = Order.all
  #   # @orderlines = Order.order_product_quantities.where(":oquantity > 0")
  # end
  
  def show
  end
  private 
    def order_params
      params.require(:order).permit!
    end
end
