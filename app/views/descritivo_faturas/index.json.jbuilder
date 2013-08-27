json.array!(@descritivo_faturas) do |descritivo_fatura|
  json.extract! descritivo_fatura, :fatura_id, :descricao, :valor
  json.url descritivo_fatura_url(descritivo_fatura, format: :json)
end
