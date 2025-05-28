class Public::MapsController < ApplicationController
  def show
    @spot = Spot.find(params[:spot_id])
  end
end

