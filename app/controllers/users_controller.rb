class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 登録したアカウントのidをパラメーターとして送信
      session[:user_id] = user.id
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  # ユーザーマイページ
  def show
    # 現在ログインしているユーザー
    @user = User.find(params[:id])

    # 現在ログインしているユーザーのマイリスト一覧
    @items = Item.where(user_id: current_user.id)
  end

  def edit
  end

  def update
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name,
                    :user_email, :birth_date, :password, :password_confirmation)
  end
end
