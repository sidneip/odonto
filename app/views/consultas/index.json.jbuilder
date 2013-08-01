json.array!(@consultas) do |consulta|
  json.extract! consulta, :data, :hora_inicio, :hora_fim, :tipo, :procedimento_id, :paciente_id, :convenio_id, :dentista_id, :observacao, :status
  json.url consulta_url(consulta, format: :json)
end
