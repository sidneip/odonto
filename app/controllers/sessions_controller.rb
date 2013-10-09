class SessionsController < ApplicationController
  before_action :is_logged?, :only => [:destroy]

  def new
  	if session[:user_id]
  	  redirect_to root_url, :alert => "Você já esta logado"
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
