# -*- encoding : utf-8 -*-
class Paciente < ActiveRecord::Base
  has_many :consultas
  belongs_to :clinica
end
