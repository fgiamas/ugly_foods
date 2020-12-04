class ProductSelectionsController < ApplicationController
  before_action :find_selection, except: [:create]

  def create
    @product_selection = ProductSelection.new(strong_params)
    if @product_selection.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def update

  end

  def destroy
    @product_selection.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_selection
    @product_selection = ProductSelection.find(params[:id])
  end

  def strong_params
    params.require(:product_selection).permit(:units, :kg, :product_id, :cart_id)
  end

end
