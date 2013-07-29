class Procedimento < ActiveRecord::Base
  validates_presence_of :nome, :mensage => "nome nulo"
end
