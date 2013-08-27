json.array!(@faturas) do |fatura|
  json.extract! fatura, :consulta_id, :descricao, :desconto, :vencimento
  json.url fatura_url(fatura, format: :json)
end
