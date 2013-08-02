Jbuilder.encode do |json|
  json.content format_content(@consultas.content)
  json.(@consulta, :created_at, :updated_at)
  json.url url_for(attachment)
end
