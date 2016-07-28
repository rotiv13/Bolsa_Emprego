class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Por favor efectue o login na aplicação."
      redirect_to login_url
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.entitie == '0'
  end

  def logged_in_entity
    unless entity?
      redirect_to root_url
    end
  end
end
