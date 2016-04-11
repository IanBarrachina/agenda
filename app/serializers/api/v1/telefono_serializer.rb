class Api::V1::TelefonoSerializer < Api::V1::BaseSerializer
  attributes :id, :numero
  has_one :contacto
end
