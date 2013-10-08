class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= Clinica.find(session[:user_id]) if session[:user_id]
  end
  
  def is_logged?
  	if current_user.nil?
  		redirect_to root_url, :alert => "Você não esta logado"
    end
  end

  helper_method :current_user
  helper_method :is_logged?
end
