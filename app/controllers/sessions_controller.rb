class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  	  redirect_to root_url, :alert => "Você já esta logado"
  	end
  end

  def create
  	user = Clinica.authenticatewithmailpass(params[:session][:email], params[:session][:password])
  	  if user
  	  session[:user_id] = user.id
        redirect_to root_url, :notice => "Logado!"
      else
        flash.now.alert = "Email ou Senha Invalido"
        render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logout!"
  end
end
