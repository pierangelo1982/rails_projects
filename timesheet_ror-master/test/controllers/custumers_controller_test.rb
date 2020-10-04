require 'test_helper'

class CustumersControllerTest < ActionController::TestCase
  setup do
    @custumer = custumers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custumers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custumer" do
    assert_difference('Custumer.count') do
      post :create, custumer: { cap: @custumer.cap, citta: @custumer.citta, civico: @custumer.civico, codfisc: @custumer.codfisc, cognome: @custumer.cognome, denominazione: @custumer.denominazione, email: @custumer.email, fax: @custumer.fax, image: @custumer.image, indirizzo: @custumer.indirizzo, latitudine: @custumer.latitudine, longitudine: @custumer.longitudine, nome: @custumer.nome, note: @custumer.note, piva: @custumer.piva, telefono: @custumer.telefono, web: @custumer.web }
    end

    assert_redirected_to custumer_path(assigns(:custumer))
  end

  test "should show custumer" do
    get :show, id: @custumer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custumer
    assert_response :success
  end

  test "should update custumer" do
    patch :update, id: @custumer, custumer: { cap: @custumer.cap, citta: @custumer.citta, civico: @custumer.civico, codfisc: @custumer.codfisc, cognome: @custumer.cognome, denominazione: @custumer.denominazione, email: @custumer.email, fax: @custumer.fax, image: @custumer.image, indirizzo: @custumer.indirizzo, latitudine: @custumer.latitudine, longitudine: @custumer.longitudine, nome: @custumer.nome, note: @custumer.note, piva: @custumer.piva, telefono: @custumer.telefono, web: @custumer.web }
    assert_redirected_to custumer_path(assigns(:custumer))
  end

  test "should destroy custumer" do
    assert_difference('Custumer.count', -1) do
      delete :destroy, id: @custumer
    end

    assert_redirected_to custumers_path
  end
end
