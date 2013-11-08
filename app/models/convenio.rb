# -*- encoding : utf-8 -*-
class Convenio < ActiveRecord::Base
	belongs_to :clinica
	validates_presence_of :clinica_id, :message => 'é necessario'
end
