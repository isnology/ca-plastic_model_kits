class KitsController < ApplicationController
  before_action :kit_params, only: [:show]
  
  def index
    @kits = Kit.all
    @toggle = true
  end

  def show
    @kit = Kit.find(params[:id])
  end
  
  private
  
  def kit_params
    params.permit(:name, :brand, :scale, :subject, :price)
  end
end
