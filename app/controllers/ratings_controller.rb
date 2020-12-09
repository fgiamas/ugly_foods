class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_back(fallback_location: root_path)
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
    params.require(:rating).permit(:content, :rating)
  end

end
