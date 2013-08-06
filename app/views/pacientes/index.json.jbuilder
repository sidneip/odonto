json.array!(@pacientes) do |paciente|
  json.extract! paciente, :nome, :sexo, :data_nascimento, :estado_civil, :nacionalidade, :nome_mae, :cep, :rua, :numero, :bairro, :cidade, :uf, :complemento, :telefone, :celular, :id, :email, :identidade_rg, :orgao_rg, :cpf
  json.url paciente_url(paciente, format: :json)
end
