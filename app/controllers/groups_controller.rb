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

  private
  def group_params
    params.require(:group).permit(:groupname)
  end
end
