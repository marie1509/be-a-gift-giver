class WillbuysController < ApplicationController
  def create
    id = params[:item_id]
    @item = Item.find(id)
    @willbuy = Willbuy.create(item_id: params[:item_id], user_id: current_user.id)
   
    @willbuy_count = @item.willbuy_count + 1
  end

  def destroy
    @item = Item.find(params[:item_id])
    willbuy = Willbuy.find_by(item_id: params[:item_id], user_id: current_user.id)
    willbuy.destroy
  
    @willbuy_count = @item.willbuy_count - 1
  end
end
