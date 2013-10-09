json.array!(@consulta_procedimentos) do |consulta_procedimento|
  json.extract! consulta_procedimento, :clinica_id, :procedimento_id, :consulta_id, :valor
  json.url consulta_procedimento_url(consulta_procedimento, format: :json)
end
