json.array!(@convenios) do |convenio|
  json.extract! convenio, :codigo_convenio, :cnpj, :razao_social, :nome_fantasia, :logradouro, :numero, :bairro, :complemento, :cep, :uf, :cidade, :telefone, :fax, :email
  json.url convenio_url(convenio, format: :json)
end
