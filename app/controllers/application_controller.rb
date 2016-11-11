class ApplicationController < ActionController::Base
  def index
    render 'layouts/index'
  end
  protect_from_forgery with: :exception
end
