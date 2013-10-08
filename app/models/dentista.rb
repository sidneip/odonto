class Dentista < ActiveRecord::Base
	belongs_to :clinica
	validates_presence_of :nome, :email, :cro, :cpf, :celular, :message => 'deve ser preenchido'
end
