class ConsultaProcedimento < ActiveRecord::Base
	belongs_to :consulta
	belongs_to :procedimento
end
