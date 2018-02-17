class DidbuysController < ApplicationController
  def create
    id = params[:item_id]
    @item = Item.find(id)
    @didbuy = Didbuy.create(item_id: params[:item_id], user_id: current_user.id)
    # redirect_to items_path

    # @didbuys = Didbuy.where(item_id: params[:item_id])
    @didbuy_count = @item.didbuy_count + 1
  end

  def destroy
    @item = Item.find(params[:item_id])
    didbuy = Didbuy.find_by(item_id: params[:item_id], user_id: current_user.id)
    didbuy.destroy
    # rediret_to items_path


    @didbuy_count = @item.didbuy_count - 1
  end
end
