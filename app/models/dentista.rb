# -*- encoding : utf-8 -*-
class Dentista < ActiveRecord::Base
	belongs_to :clinica
	has_many :consulta
	validates_presence_of :nome, :email, :cro, :cpf, :celular, :message => 'deve ser preenchido'
end
