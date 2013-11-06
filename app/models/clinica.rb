# -*- encoding : utf-8 -*-
class Clinica < ActiveRecord::Base

  def self.authenticate(password)
    if(user.password == password)
      return user
    end
  end

  def self.authenticatewithmailpass(email, password)
  	user = find_by_email(email)
  	if user
  	  if user.password == password
  	  	return user
  	  else 
  	  	nil
  	  end
    end
  end

end
