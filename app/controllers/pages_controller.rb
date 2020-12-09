class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.all
    @disable_navbar = true
    @markers = @shops.geocoded.map do |shop|
     {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "shops/info_window", locals: { shop: shop }),

        image_url: helpers.asset_url('carrot.png')
      }
    end
  end
end
