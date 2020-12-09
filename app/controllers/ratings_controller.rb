class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @rating.shop = Shop.find(params[:shop_id])
    @rating.user = current_user
    if @rating.save!
      redirect_back(fallback_location: root_path)
      flash[:notice] = "your review has been submitted"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "something went wrong, please try again"
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to shop_path(@rating.shop)
  end

   private

  def rating_params
    params.require(:rating).permit(:content, :rating)
  end

end
