class UsersController < ApplicationController
    # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image: "home.jpg",)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to ("/users/#{@user.id}")
    else
      render "new"
    end
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(email: params[:email], password: params[:password],name: params[:name],image: params[:image], introduction: params[:introduction])
      redirect_to ("/users/index")
    else
      render ("/users/index")
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to ("/users/index")
  end

  def account
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end
end
