class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,:update,:destroy]
  before_action :force_login, only: [:new,:create,:index]

  def new
    @item = Item.new
    respond_to do |format|
      format.js
    end
  end

  def create

    @item = Item.new(item_params)
    @item.user_id = current_user.id

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
    # リストを作成された順に表示
    @items = Item.all.order(created_at: :desc)

  end

  def edit
    # 編集したいアイテムのidを取得

  end

  def update
    # 編集したいアイテムのidを取得

     @item.update(item_params)
     redirect_to items_path

  end

  def destroy

    @item.destroy
   
    redirect_to items_path
  end


private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:item_name, :item_image, :item_detail, :item_cost)
  end
end
