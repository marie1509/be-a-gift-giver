class ItemsController < ApplicationController
  def new
    @item = Item.new

    # 下記の記述でどんなリクエストでもjsに飛ぶ
    respond_to do |format|
      format.js
    end
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path }
        format.js { @status = "success"}
      else
        format.html { render :index }
        format.js { @status = "fail" }
      end
    end
  end

  def index
    @items = Item.all
  end

private

def item_params
  params.require(:item).permit(:item_name, :item_image, :item_detail, :item_cost)
end
end
