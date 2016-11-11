class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
    if not session[:uid] or not (session[:uid] == @message.to_user.id or session[:uid] == @message.from_user.id)
      redirect_to(root_url)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to user_path(session[:uid])
  end
end
