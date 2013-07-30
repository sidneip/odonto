#encoding: utf-8
class Procedimento < ActiveRecord::Base
  
  #validações dos campos
  validates_presence_of :nome, :message => "não pode ser em branco"
  validates_numericality_of :custo, :allow_nil => true, :message => "deve ser numeros"
end
