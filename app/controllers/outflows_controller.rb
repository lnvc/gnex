class OutflowsController < ApplicationController
  def new
    @outflow = Outflow.new
  end
  def create
    @outflow = Outflow.new(outflow_params)
    
    @outflow_line = @outflow.outflow_product_quantities.all
    @outflow_line.each do |product| 
      @product = Product.where(:id => product.product_id).first
      @product.currquantity += product.iquantity
      @product.save
    end
    
    if @outflow.save
      @order = Order.where(:receipt => @outflow.creceipt).first
      @order.status = FALSE
      @order.save
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
