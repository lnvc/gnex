class AddsController < ApplicationController
  def index
    @suppliers = Supplier.all
  end
end
