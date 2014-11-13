# -*- encoding : utf-8 -*-
class Convenio < ActiveRecord::Base
	belongs_to :clinica
	validates_presence_of :clinica_id, :message => 'é necessario'
	validates_presence_of :codigo_convenio, :message => 'é necessario'
	validates_presence_of :cnpj, :message => 'é necessario'
	validates_presence_of :razao_social, :message => 'é necessario'
end
