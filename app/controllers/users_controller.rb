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
    if @user.id != session[:uid]
      redirect_to(:back)
    end
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.id != session[:uid]
      redirect_to(:back)
    end
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
    redirect_to root_url
  end

  def new_message
    @user = User.find(params[:id])
    @message = Message.new
  end

  def send_message
    @message = Message.new(message_params)
    @message.from_user = User.find(session[:uid])
    @message.to_user = User.find(params[:id])
    @message.save!
    redirect_to(users_path(@message.from_user))
  end

  private
  def user_params
    params.require(:user).permit(:username, :nickname, :password, :password_confirmation)
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
