# -*- encoding : utf-8 -*-
class Paciente < ActiveRecord::Base
  has_many :consultas
  belongs_to :clinica

  validates :celular, length: { maximum: 10 }

end
