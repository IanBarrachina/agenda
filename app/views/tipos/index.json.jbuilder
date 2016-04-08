json.array!(@tipos) do |tipo|
  json.extract! tipo, :id, :tipo
  json.url tipo_url(tipo, format: :json)
end
