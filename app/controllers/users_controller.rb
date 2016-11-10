class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:uid] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def login
    @user = User.new
  end

  def postlogin
    @user = User.where(username: User.new(user_params).username, password: User.new(user_params).password).take
    if @user
      session[:uid] = @user.id
      redirect_to @user
    else
      redirect_to(:back)
    end
  end

  def logout
    session[:uid] = nil
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :nickname, :password, :password_confirmation)
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
