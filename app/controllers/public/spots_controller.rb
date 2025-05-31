class Public::SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
  end
end
