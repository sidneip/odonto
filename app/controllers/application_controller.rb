class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    if(Clinica.where("id = ?", session[:clinica_id]).count < 1 || session[:clinica_id].nil?)
      session[:user_id] = nil
      session[:clinica_id] = nil
      return nil
    else
      @current_user ||= Clinica.find(session[:clinica_id])
    end
  end
  
  def is_logged?
  	if current_user.nil?
  		redirect_to root_url, :alert => "Você não esta logado"
    end
  end

  def permissao?
    return 'clinica'  if session[:tipo] == 'clinica'
    return 'dentista' if session[:tipo] == 'dentista'
    return 'paciente' if session[:tipo] == 'paciente'
  end 

  helper_method :current_user
  helper_method :is_logged?
end
