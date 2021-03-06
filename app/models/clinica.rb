# -*- encoding : utf-8 -*-
require 'digest/md5'
class Clinica < ActiveRecord::Base
  before_save   :encrypt
  before_update   :encrypt
  validates_uniqueness_of :email
  validates_presence_of   :password
  has_attached_file :logo, :styles => { :small => "150x150" }
  def encrypt
    if new_record?
      self.password = Digest::MD5.hexdigest(password)
    end
  end

  def self.authenticate(password)
    if(user.password == Digest::MD5.hexdigest(password))
      return user
    end
  end

  def self.authenticatewithmailpass(email, password)
  	user = find_by_email(email)
  	if user
  	  if user.password == Digest::MD5.hexdigest(password)
  	  	return user
  	  else 
  	  	nil
  	  end
    end
  end

end
