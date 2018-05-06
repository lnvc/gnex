class OutflowsController < ApplicationController
  def new
    @outflow = Outflow.new
  end
  def create
    @outflow = Outflow.new(outflow_params)
    # update each product's quantity
    @outflow_line = @outflow.outflow_product_quantities
    @outflow_line.each do |product| 
      @product = Product.find_by(id: product.product_id)
      @product.currquantity -= product.oquantity
      @product.save
    # update order
    @order = Order.find_by(receipt: @outflow.receipt)
    @order.total = 0
    @order.status = false
    @order.save
    end
    if @outflow.save
      redirect_to balances_index_path, notice: "Outflow successfully added."
    else
      render :new
    end
  end
  private 
    def outflow_params
      params.require(:outflow).permit!
    end
end
