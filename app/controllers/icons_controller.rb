class IconsController < ApplicationController
  def new
    @icon = Icon.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @icon = Icon.new(icon_params)
    @icon.user_id = current_user.id

    @icon.save
      redirect_to user_path(current_user.id)
  end

  def edit
    # パラメーターとしてuser_idが送られてくる

    @icon = Icon.find_by(user_id:params[:id])

  end

  def update
    @icon = Icon.find(params[:id])
      @icon.update(icon_params)
      redirect_to user_path(current_user.id)
  end

private

  def icon_params
     params.require(:icon).permit(:icon)
  end
end
