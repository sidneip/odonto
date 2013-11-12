# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  before_action :is_logged?, :only => [:destroy]

  def new
  	if session[:user_id]
  	  redirect_to root_url, :alert => "Você já esta logado"
  	end
  end

  def dentista
  end

  def create_dentista
    user = Dentista.authenticatewithmailpass(params[:session][:email], params[:session][:password])
      if user
        session[:user_id] = user.id
        session[:tipo]    = 'dentista'
        session[:clinica_id] = user.clinica.id
        redirect_to root_url, :notice => "Logado!"
      else
        flash.now.alert = "Email ou Senha Invalido"
        render dentista_sessions_path
      end
  end

  def create
  	user = Clinica.authenticatewithmailpass(params[:session][:email], params[:session][:password])
      if user
  	    session[:user_id] = user.id
        session[:tipo]    = 'clinica'
        session[:clinica_id] = user.id
        redirect_to root_url, :notice => "Logado!"
      else
        flash.now.alert = "Email ou Senha Invalido"
        render "new"
      end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logout!"
  end
end
