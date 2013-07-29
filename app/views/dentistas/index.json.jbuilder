json.array!(@dentistas) do |dentista|
  json.extract! dentista, :nome, :email, :password, :sexo, :data_nasc, :estado_civil, :cep, :rua, :numero, :bairro, :cidade, :uf, :complemento, :telefone, :celular, :identidade_rg, :orgao_rg, :cpf, :cro
  json.url dentista_url(dentista, format: :json)
end
