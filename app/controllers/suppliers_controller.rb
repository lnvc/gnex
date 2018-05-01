class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:edit, :update, :show]
    
    def new
        @supplier = Supplier.new
    end
    def show

    end
    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            redirect_to adds_index_path, notice: "Supplier successfully added."
        else
            render :new 
        end
    end
    def edit
    end
    def update
        if @supplier.update(supplier_params)
            redirect_to updates_index_path, notice: "Supplier successfully updated."
        else
            render :edit
        end
    end
    private 
        def supplier_params
            params.require(:supplier).permit!
            # (:sname, :saddress, :scontactn, :scontactp, :spayment, :snotes)
        end
        def set_supplier
            @supplier = Supplier.find(params[:id])
            redirect_to updates_index_path, notice: "Supplier not found." if @supplier.nil? 
        end
end
