class SummariesController < ApplicationController
  def index
    @product = Product.find(params[:id])
    # @products = Array.new
    # @arr = Array.new
    #   Inflow.all.each do |inflow| 
    #     inflow.inflow_product_quantities.each do |line|
    #       if line.product_id == @product.id
    #         @arr << line.created_at
    #         @arr << line.iquantity
    #         @products << @arr
    #         @arr.clear
    #       end
    #     end
    # end
    @products = []
    Inflow.all.each do |inflow|
      inflow.inflow_product_quantities.each do |line|
        if line.product_id == @product.id
          @products << line.created_at.strftime("%B %d, %Y")
          @products << line.iquantity
        end
      end
    end
    @products_o=[]
    Outflow.all.each do |outflow|
      outflow.outflow_product_quantities.each do |line|
        if line.product_id == @product.id
          @products_o << line.created_at.strftime("%B %d, %Y")
          @products_o << line.oquantity
        end
      end
    end
    # @products = Inflow.select(:inflow_product_quantities).where(:product_id => @product.id).all
    redirect_to updates_index_path, notice: "Product not found." if @product.nil? 
    # @product = params[:product]
  end
  def list
  end
end
