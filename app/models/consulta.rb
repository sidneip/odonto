#encoding:utf-8
class Consulta < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :procedimento
  belongs_to :convenio
  belongs_to :dentista
  validates_presence_of :data,:paciente_id, :tipo, :dentista,:status,  :message => 'é necessario'
end
