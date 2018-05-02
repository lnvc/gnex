class InflowsController < ApplicationController
  def new
    @inflow = Inflow.new
  end
  def create
    @inflow = Inflow.new(inflow_params)
    
    # update each product's quantity
    @inflow_line = @inflow.inflow_product_quantities
    @inflow_line.each do |product| 
      @product = Product.find_by(id: product.product_id)
      @product.currquantity += product.iquantity
      @product.save
    end
    if @inflow.save
      redirect_to balances_index_path, notice: "Inflow successfully added."
    else
      render :new
    end
  end
  # def update_products
  #   @products = Product.where("id = ?", params[:id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end
  
  # def show
  #   @product = Product.first
  #   # @product = Product.find(params[:id])
  # end
  private 
    def inflow_params
      params.require(:inflow).permit!
    end
end
