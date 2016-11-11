class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @user = User.find(session[:uid])
      Membership.new({user: @user, group: @group}).save
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:id])
    @user = User.find(session[:uid])
    Membership.new({user: @user, group: @group}).save
    redirect_to(:back)
  end

  def drop
    @group = Group.find(params[:id])
    @user = User.find(session[:uid])
    @group.users.delete(@user)
    redirect_to(:back)
  end

  def new_message
    @group = Group.find(params[:id])
    @message = Message.new
  end

  def send_message
    @group = Group.find(params[:id])
    @group.users.each do |user|
      @message = Message.new(message_params)
      @message.from_user = User.find(session[:uid])
      @message.to_user = User.find(user.id)
      @message.save!
    end
    redirect_to(users_path(session[:uid]))
  end

  private
  def group_params
    params.require(:group).permit(:groupname)
  end
  
  private
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
