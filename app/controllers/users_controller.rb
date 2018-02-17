class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 登録したアカウントのidをパラメーターとして送信
      session[:user_id] = @user.id
      redirect_to items_path
    else
      render 'new'
    end
  end

  # ユーザーマイページ
  def show
    # 現在ログインしているユーザー又はアイテム作成者を取得

    # 現在ログインしているユーザー又はアイテム作成者のマイリスト一覧
    @items = Item.where(user_id: params[:id]).order(created_at: :desc)

    if params[:yourpage]
      if @user == current_user
        # マイページ
        redirect_to user_path(@user.id)
      else
        # 他者ユーザーページ
        render 'yourpage'
      end
    end

    @letsbuys = Letsbuy.where(user_id: params[:id]).order(created_at: :desc)
  end

  def edit
  end

  def update

    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name,
                    :user_email, :birth_date, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
