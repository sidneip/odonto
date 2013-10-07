class Clinica < ActiveRecord::Base

  def self.authenticate(email, password)
  	@user = find_by_email(email)
  	if @user
  		puts @user.senha
  		puts password
  	  if @user.senha == password
  	  	return @user
  	  else 
  	  	nil
  	  end
    end
  end
end
