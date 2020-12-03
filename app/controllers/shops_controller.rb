class ShopsController < ApplicationController
  before_action :find_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @fruit_and_veg_produce = ProduceType.where("category: ? or ")
    @shops = Shop.all

    if params[:search].present?
      @location = params[:search][:location]
      @km = params[:search][:km]
      @flowers = params[:search][:flowers]&.reject(&:blank?)
      @prod = params[:search][:fruits_and_veggies]&.reject(&:blank?)
    end

    if @km && !@km.empty?
      @shops = @shops.near(@location, @km)
    end

    if @flowers && !@flowers.empty?
      @shops = @shops.joins(products: :produce_type).merge(Shop.joins(products: :produce_type).where(produce_types: { name: @flowers }))
    end

    if @prod && !@prod.empty?
      @shops = @shops.joins(products: :produce_type).merge(Shop.joins(products: :produce_type).where(produce_types: { name: @prod }))
    end

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
