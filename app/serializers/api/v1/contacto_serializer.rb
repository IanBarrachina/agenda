class Api::V1::ContactoSerializer < Api::V1::BaseSerializer
  attributes :id, :nombre, :apellidos, :email, :foto, :created_at, :updated_at

  has_many :telefonos

end