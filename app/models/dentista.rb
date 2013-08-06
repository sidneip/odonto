class Dentista < ActiveRecord::Base
	validates_presence_of :nome, :email, :cro, :cpf, :celular, :message => 'deve ser preenchido'
end
