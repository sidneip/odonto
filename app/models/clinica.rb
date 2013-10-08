class Clinica < ActiveRecord::Base
  has_secure_password
  validate_presence_of :senha, :on => :create
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
