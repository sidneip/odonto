class Paciente < ActiveRecord::Base
  has_many :consultas
end
