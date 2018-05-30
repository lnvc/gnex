class OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = Order.all
    @print = Array.new
    
    @orders.each do |order|
      
      if order.status == TRUE
        
        order.order_product_quantities.all.each do |product|
          @product = Product.where(:id => product.product_id).first
          if product.oquantity > @product.currquantity
            order.status = FALSE;
            order.save
            break
          end
        end
        
        if order.status == TRUE
          @print << order.receipt
        else
          order.status = TRUE;
          order.save
        end
        
      end
      
    end
  end
  def create
    @order = Order.new(order_params)

    # @order_line = @order.order_product_quantities.all
      @order.total = 0
      @order.status = TRUE
      if @order.save
        redirect_to orders_new_path, notice: "Order successfully added."
      else
        render :new
      end
  end

  def show
  end
  private 
    def order_params
      params.require(:order).permit!
    end
end
