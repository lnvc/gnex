class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show]
    
    def new
        @product = Product.new
    end
    def show

    end
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to adds_index_path, notice: "Product successfully added."
        else
            render :new 
        end
    end
    def edit
    end
    def update
        if @product.update(product_params)
            redirect_to updates_index_path, notice: "Product successfully updated."
        else
            render :edit
        end
    end
    private 
        def product_params
            params.require(:product).permit(:pname, :price, :unit, :reorder, :loc, :currquantity, :status, :supplier_id)
        end
        def set_product
            @product = Product.find(params[:id])
            redirect_to updates_index_path, notice: "Product not found." if @product.nil? 
        end
end
