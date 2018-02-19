class LetsbuysController < ApplicationController
  def new
    if params[:back]
      @letsbuy = Letsbuy.new(letsbuy_params)
      @item = Item.find(params[:letsbuy][:item_id])
    else
      @letsbuy = Letsbuy.new
      @item = Item.find(params[:id])
    end
  end

  def confirm
    @item = Item.find(params[:id])
    @letsbuy = Letsbuy.new(letsbuy_params)
  end

  def create
    @letsbuy = Letsbuy.new(letsbuy_params)

    if @letsbuy.save
      render 'create'
    else
      render 'new'
    end
  end

  private

    def letsbuy_params
      params.require(:letsbuy).permit(:item_id, :user_id, :pay_amount)
    end


end
