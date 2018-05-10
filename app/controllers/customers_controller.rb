class CustomersController < ApplicationController
    before_action :set_customer, only: [:edit, :update, :show, :destroy]
    def new
        @customer = Customer.new
    end
    def show
        
    end
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            redirect_to adds_index_url, notice: "Customer successfully added."
        else
            render :new 
        end
    end
    
    def edit
        @customers = Customer.all
    end
    def update
        if @customer.update(customer_params)
            redirect_to updates_index_path, notice: "Customer successfully updated."
        else
            render :edit
        end 
    end
    def destroy
        if @customer.delete
            redirect_to updates_index_path, notice: "Customer successfully deleted."
        else
            render :edit
        end
    end
    private 
        def customer_params
            params.require(:customer).permit!
        end
        def set_customer
            @customer = Customer.find(params[:id])
            redirect_to updates_index_path, notice: "Customer not found." if @customer.nil? 
        end
end
