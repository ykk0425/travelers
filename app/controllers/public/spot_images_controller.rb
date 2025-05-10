class Public::SpotImagesController < ApplicationController
  def destroy
    spot = Spot.find(params[:spot_id])
    image = spot.images.find(params[:id])
    image.purge
    redirect_to edit_plan_path(spot.plan), notice: '画像を削除しました'
  end
end
