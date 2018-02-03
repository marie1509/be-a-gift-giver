class WillbuysController < ApplicationController
  def create
    id = params[:item_id]
    @item = Item.find(id)
    @willbuy = Willbuy.create(item_id: params[:item_id], user_id: current_user.id)

    # 合計willbuysを表示するため
    @willbuys = Willbuy.where(item_id: params[:item_id])
    # 以下は何のための記述？不必要？
    @items = Item.all
  end

  def destroy
    # find_byも条件を複数指定できる！
    @willbuy = Willbuy.find_by(item_id: params[:item_id], user_id: current_user.id)
    @willbuy.destroy

    # 合計willbuysを表示するため
    @willbuys = Willbuy.where(item_id: params[:item_id])
    # 以下は何のための記述？不必要？
    @items = Item.all
  end
end
