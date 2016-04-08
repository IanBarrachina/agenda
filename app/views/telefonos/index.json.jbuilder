json.array!(@telefonos) do |telefono|
  json.extract! telefono, :id, :numero, :contacto_id
  json.url telefono_url(telefono, format: :json)
end
