class ShopsController < ApplicationController
  before_action :find_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @fruit_and_veg_produce = ProduceType.where("category: ? or ")
    @shops = Shop.all
    @markers = @shops.geocoded.map do |shop|
     {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),

        image_url: helpers.asset_url('carrot.png')
      }
    end
  end


  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(strong_params)
    @shop.user = current_user
    @shop.user.address = current_user.address
    if @shop.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @shop
    if @shop.update(strong_params)
      flash[:notice] = "Updated"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @shop = Shop.destroy(strong_params)
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:shop).permit(:id, :address, :city, :post_code, :country, :name, :phone_number, :website, :photo)
  end

  def find_shop
    @shop = Shop.find(params[:id])
  end
end
