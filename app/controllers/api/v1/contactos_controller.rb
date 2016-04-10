class Api::V1::ContactosController < Api::V1::BaseController
  def show
    contacto = Contacto.find(params[:id])

    render(json: Api::V1::ContactoSerializer.new(contacto).to_json)
  end
end