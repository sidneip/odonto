json.array!(@clinicas) do |clinica|
  json.extract! clinica, :nome, :email, :senha
  json.url clinica_url(clinica, format: :json)
end
