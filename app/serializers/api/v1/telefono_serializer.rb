class TelefonoSerializer < ActiveModel::Serializer
  attributes :id, :numero
  has_one :contacto
end
