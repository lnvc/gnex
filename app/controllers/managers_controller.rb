class ManagersController < ApplicationController
  before_action :set_manager, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @manager = current_user.managers.new
  end

  def create 
    @manager = current_user.managers.new(manager_params)
    if @manager.save
      redirect_to managers_path, notice: "Manager successfully added."
    else
      render :new
    end
  end

  def edit
  end
  
  def destroy
    if @manager.destroy
      redirect_to managers_path, notice: "Manager successfully destroyed."
    end
  end
  
  def update
    if @manager.update(manager_params)
      redirect_to managers_path, notice: "Manager updated."
    else
      render :edit
    end
  end
  private
  def set_manager
    @manager = Manager.find(params[:id])
    if @manager.nil?
      redirect_to managers_path, notice: "Manager not found."
    end
  end
  def manager_params
    params.require(:manager).permit!
  end
end
