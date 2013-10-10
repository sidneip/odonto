#encoding:utf-8
class Consulta < ActiveRecord::Base
  belongs_to :paciente
  belongs_to :procedimento
  belongs_to :convenio
  belongs_to :dentista
  has_one    :fatura
  belongs_to :clinica
  has_many   :consulta_precedimento
  validates_presence_of :data,:paciente_id, :tipo, :dentista,:status,  :message => 'é necessario'
  validate :horadentista
  before_save :horadentista, :on => :save

  def horadentista()
  	hora_consulta = self.hora_inicio.gsub(":","")..self.hora_fim.gsub(":","")
    consultas = Consulta.where("dentista_id='#{self.dentista_id}' AND data = '#{self.data}'")
    consultas.each do |consulta|
      hora_existente  = consulta.hora_inicio.gsub(":","")..consulta.hora_fim.gsub(":","")
      puts hora_existente
      if hora_consulta.include?(hora_existente)
      	errors.add(:data, "e Hora ocupada para o dentista")
      	return false
      end
      break
    end
  end
end
