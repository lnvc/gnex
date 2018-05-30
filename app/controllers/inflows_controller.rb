class InflowsController < ApplicationController
  def new
    @inflow = Inflow.new
  end
  def create
    @inflow = Inflow.new(inflow_params)
    
    if @inflow.save
    # update each product's quantity
    @inflow_line = @inflow.inflow_product_quantities.all
    @inflow_line.each do |product| 
      @product = Product.where(:id => product.product_id).first
      @product.currquantity += product.iquantity
      @product.save
    end
      redirect_to balances_index_path, notice: "Inflow successfully added."
    else
      render :new
    end
  end

  private 
    def inflow_params
      params.require(:inflow).permit!
    end
end
