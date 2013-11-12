# -*- encoding : utf-8 -*-
class Dentista < ActiveRecord::Base
	belongs_to :clinica
	has_many :consulta
	validates_presence_of :nome, :email, :cro, :cpf, :celular, :message => 'deve ser preenchido'
	before_save   :encrypt
    before_update :encrypt

  	def encrypt
   	  self.password = Digest::MD5.hexdigest(password)
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
