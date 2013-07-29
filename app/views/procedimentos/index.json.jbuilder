json.array!(@procedimentos) do |procedimento|
  json.extract! procedimento, :nome, :tipo, :valor, :custo
  json.url procedimento_url(procedimento, format: :json)
end
