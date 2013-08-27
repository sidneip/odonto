class Fatura < ActiveRecord::Base
  belongs_to :consulta
  has_many   :descritivo_fatura
end
