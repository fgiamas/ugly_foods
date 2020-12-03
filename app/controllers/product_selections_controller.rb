class ProductSelectionsController < ApplicationController

  def create
    @product_selection = ProductSelection.new(strong_params)
    if @product_selection.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:product_selection).permit(:units, :kg, :product_id, :cart_id)
  end

end
