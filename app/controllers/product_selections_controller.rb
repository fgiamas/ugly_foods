class ProductSelectionsController < ApplicationController
  before_action :find_selection, except: [:create]

  def create
    if @product_selection = ProductSelection.find_by(find_params)
      if strong_params[:units].present?
        @product_selection.units += strong_params[:units].to_i
      end
      if strong_params[:kg].present?
        @product_selection.kg += strong_params[:kg].to_i
      end

    else
      @product_selection = ProductSelection.new(strong_params)
    end
    @product = @product_selection.product
    if @product_selection.save
      redirect_back(fallback_location: root_path)
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

  def find_params
    params.require(:product_selection).permit(:product_id, :cart_id)
  end

end
