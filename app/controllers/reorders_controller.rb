class ReordersController < ApplicationController
  def index
    @products = Product.where("currquantity <= reorder")
    # @supplier = Supplier.where()
  end
  def reorder
    @products = Product.where("currquantity <= reorder")
    respond_to do |format|
      format.pdf do
        render pdf: "Reorder_List_"+Time.now.strftime('%v %H:%M:%S').to_s,
               template: "reorders/reorder.pdf.erb",
               locals: {:products => @products}
      end
    end
  end
end
