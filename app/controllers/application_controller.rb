# -*- encoding : utf-8 -*-
#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_logged?
  private
  
  def current_user
    if(Clinica.where("id = ?", session[:clinica_id]).count < 1 || session[:clinica_id].nil?)
      session[:user_id] = nil
      session[:clinica_id] = nil
      return nil
    else
      if session[:tipo] == 'clinica'
        @current_user = Clinica.find(session[:clinica_id])
      end
      if session[:tipo] == 'dentista'
        @current_user ||= Dentista.find(session[:user_id])
      end
    end
    return @current_user
  end

  # REFATORAR ESSE METHOD DE AUTORIZACAO  
  def is_logged?
    if session[:clinica_id].nil?
      redirect_to root_url, :alert => "Voce nao esta logado"
    end
  end

  def permissao?
    return 'clinica'  if session[:tipo] == 'clinica'
    return 'dentista' if session[:tipo] == 'dentista'
    return 'paciente' if session[:tipo] == 'paciente'
  end 

end
