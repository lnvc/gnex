class OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = Order.all
    @flag = 0
  end
  def create
    @order = Order.new(order_params)

    # initialize
    @order.total = 0
    @order.status = false
    # check each line's product's quantity
    @order_line = @order.order_product_quantities
    
    # if has products, valid
    if !@order_line.empty?
      @order_line.each do |product| 
        # add each to total
        # @order.total += product.oquantity
        # check if product.currquantity - quan < 0, if < 0 , incomplete orders list
        @product = Product.find_by(id: product.product_id)
        if @product.currquantity - product.oquantity < 0
          # true = incomplete
          @order.status = true
          # needed quantity to complete order
          # product.oquantity -= @product.currquantity
          @order.total += product.oquantity
          # @product.currquantity = 0
        # else
          # @order.total += product.oquantity
          # @product.currquantity -= product.oquantity
          # product.oquantity = 0
        end
        @product.save
        if @order.status == true
          break
        end
      end
      
      if @order.save
        redirect_to orders_new_path, notice: "Order successfully added."
      else
        render :new
      end
    # else, invalid
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
