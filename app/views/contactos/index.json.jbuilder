json.array!(@contactos) do |contacto|
  json.extract! contacto, :id, :nombre, :apellidos, :email, :foto, :user_id
  json.url contacto_url(contacto, format: :json)
end
