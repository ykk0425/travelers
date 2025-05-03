class SpotImagesController < ApplicationController
  before_action :set_spot

  def destroy
    # 対象の画像を取得
    image = @spot.images.find(params[:id])

    # 削除
    image.purge

    redirect_to plan_path(@spot.plan), notice: '画像を削除しました。'
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end