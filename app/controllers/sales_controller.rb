class SalesController < ApplicationController
  before_action :set_sale, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @sale = current_user.sales.new
  end

  def create 
    @sale = current_user.sales.new(sale_params)
    if @sale.save
      redirect_to sales_path, notice: "Sale user successfully added."
    else
      render :new
    end
  end

  def edit
  end
  
  def destroy
    if @sale.destroy
      redirect_to sales_path, notice: "Sale user successfully destroyed."
    end
  end
  
  def update
    if @sale.update(sale_params)
      redirect_to sales_path, notice: "Sale user updated."
    else
      render :edit
    end
  end
  private
  def set_sale
    @sale = Sale.find(params[:id])
    if @sale.nil?
      redirect_to sales_path, notice: "Sales user not found."
    end
  end
  def sale_params
    params.require(:sale).permit!
  end
end
