# Comento la ruta que no vamos a permitir, al menos en esta version

require 'test_helper'

class ContactosControllerTest < ActionController::TestCase
  setup do
    sign_in(:user, users(:ian))
    @contacto = contactos(:one)
  end

#  test "should get index" do
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:contactos)
#  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contacto" do
    assert_difference('Contacto.count') do
      post :create, contacto: { apellidos: @contacto.apellidos, email: "aaa@contacto.com", foto: @contacto.foto, nombre: @contacto.nombre, user_id: @contacto.user_id, tipo_id: @contacto.tipo.id }
    end

    assert_redirected_to contacto_path(assigns(:contacto))
  end

  test "should show contacto" do
    get :show, id: @contacto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contacto
    assert_response :success
  end

  test "should update contacto" do
    patch :update, id: @contacto, contacto: { apellidos: @contacto.apellidos, email: @contacto.email, foto: @contacto.foto, nombre: @contacto.nombre, user_id: @contacto.user_id }
    assert_redirected_to contacto_path(assigns(:contacto))
  end

  test "should destroy contacto" do
    assert_difference('Contacto.count', -1) do
      delete :destroy, id: @contacto
    end

    assert_redirected_to contactos_path
  end
end
