class OutflowsController < ApplicationController
  def new
    @outflow = Outflow.new
  end
  def create
    @outflow = Outflow.new(outflow_params)
    if @outflow.save
      redirect_to balances_index_path, notice: "Outflow successfully added."
    else
      render :new
    end
  end
  private 
    def outflow_params
      params.require(:outflow).permit!
    end
end
