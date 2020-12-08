class LikesController < ApplicationController
  before_action :find_shop
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @shop.likes.create(user_id: current_user.id)
    end
      redirect_to shop_path(@shop, anchor: "heart")
  end

  def destroy
    @like.destroy
    redirect_to shop_path(@shop, anchor: "heart")
  end



  private

  def already_liked?
    Like.where(user_id: current_user.id, shop_id:
    params[:shop_id]).exists?
  end

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

  def find_like
    @like = @shop.likes.find(params[:id])
  end

end
