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
          @products << (line.cost).round(2)
          @products << (line.cost * 1.20).round(2)
        end
      end
    end
    @products_o=[]
    @customer = Customer.all
    Outflow.all.each do |outflow|
      outflow.outflow_product_quantities.each do |line|
        if line.product_id == @product.id
          @products_o << line.created_at.strftime("%B %d, %Y")
          @products_o << outflow.receipt
          @products_o << line.oquantity
          @products_o << @customer[outflow.customer_id-1].cname
        end
      end
    end
    # @products = Inflow.select(:inflow_product_quantities).where(:product_id => @product.id).all
    redirect_to updates_index_path, notice: "Product not found." if @product.nil? 
    respond_to do |format|
      format.pdf do
        render pdf: "Product_Summary_"+"#{@product.pname}"+"_"+"#{@product.loc}"+"_"+Time.now.strftime('%v %H:%M:%S').to_s,
               template: "summaries/index.pdf.erb",
               locals: {:product => @product}
      end
    end
    # @product = params[:product]
  end
  def prod
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
          @products << (line.cost).round(2)
          @products << (line.cost * 1.20).round(2)
        end
      end
    end
    @products_o=[]
    @customer = Customer.all
    Outflow.all.each do |outflow|
      outflow.outflow_product_quantities.each do |line|
        if line.product_id == @product.id
          @products_o << line.created_at.strftime("%B %d, %Y")
          @products_o << outflow.receipt
          @products_o << line.oquantity
          @products_o << @customer[outflow.customer_id-1].cname
        end
      end
    end
    # @products = Inflow.select(:inflow_product_quantities).where(:product_id => @product.id).all
    redirect_to updates_index_path, notice: "Product not found." if @product.nil? 
  end
  def list
  end
end
