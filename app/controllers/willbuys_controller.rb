class WillbuysController < ApplicationController
  def create
    id = params[:item_id]
    @item = Item.find(id)
    @willbuy = Willbuy.create(item_id: params[:item_id], user_id: current_user.id)
    # redirect_to items_path
    # 合計willbuysを表示するため
    # @willbuys = Willbuy.where(item_id: params[:item_id])
    @willbuy_count = @item.willbuy_count + 1
  end

  def destroy
    # find_byも条件を複数指定できる！
    @item = Item.find(params[:item_id])
    willbuy = Willbuy.find_by(item_id: params[:item_id], user_id: current_user.id)
    willbuy.destroy
    # redirect_to items_path

    # 合計willbuysを表示するため
    # @willbuys = Willbuy.where(item_id: params[:item_id])
    @willbuy_count = @item.willbuy_count - 1
  end
end
