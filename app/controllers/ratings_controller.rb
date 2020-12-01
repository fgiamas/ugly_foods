class RatingsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @shop = Shop.find(params[:shop_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @shop = Shop.find(params[:shop_id])
    @rating.shop = @shop
    if @rating.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to shop_path(@rating.shop)
  end

   private

  def rating_params
    params.require(:rating).permit(:content)
  end
end
