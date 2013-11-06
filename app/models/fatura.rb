# -*- encoding : utf-8 -*-
class Fatura < ActiveRecord::Base
  belongs_to :consulta
  has_many   :descritivo_fatura
  validates_presence_of :consulta_id, :message => 'é necessario'
  belongs_to :clinica
  def total_fatura
  	@total = 0
  	self.descritivo_fatura.each do |descritivo|
  		@total = @total + descritivo.valor
  	end
  	return @total
  end

end
