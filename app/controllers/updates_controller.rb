class UpdatesController < ApplicationController
    def index
        @suppliers = Supplier.all
    end
    def show
    end
    def list_s
        @suppliers = Supplier.all
    end
    def list_p
        @products = Product.all
    end
    def list_c
        @customers = Customer.all
    end
end
