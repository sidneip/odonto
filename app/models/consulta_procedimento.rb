# -*- encoding : utf-8 -*-
class ConsultaProcedimento < ActiveRecord::Base
	belongs_to :consulta
	belongs_to :procedimento
	validates_presence_of :clinica_id, :message => 'é necessario'
end
