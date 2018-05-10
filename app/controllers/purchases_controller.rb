class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @purchase = current_user.purchases.new
  end

  def create 
    @purchase = current_user.purchases.new(purchase_params)
    if @purchase.save
      redirect_to purchases_path, notice: "Purchase user successfully added."
    else
      render :new
    end
  end

  def edit
  end
  
  def destroy
    if @purchase.destroy
      redirect_to purchases_path, notice: "Purchase user successfully destroyed."
    end
  end
  
  def update
    if @purchase.update(purchase_params)
      redirect_to purchases_path, notice: "Purchase user updated."
    else
      render :edit
    end
  end
  private
  def set_purchase
    @purchase = Purchase.find(params[:id])
    if @purchase.nil?
      redirect_to purchases_path, notice: "Purchasing user not found."
    end
  end
  def purchase_params
    params.require(:purchase).permit!
  end
end
