require 'test_helper'

class OperatoresControllerTest < ActionController::TestCase
  setup do
    @operatore = operatores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operatores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operatore" do
    assert_difference('Operatore.count') do
      post :create, operatore: { cap: @operatore.cap, citta: @operatore.citta, civico: @operatore.civico, codfisc: @operatore.codfisc, cognome: @operatore.cognome, denominazione: @operatore.denominazione, email: @operatore.email, fax: @operatore.fax, indirizzo: @operatore.indirizzo, nome: @operatore.nome, note: @operatore.note, piva: @operatore.piva, provincia: @operatore.provincia, tel: @operatore.tel }
    end

    assert_redirected_to operatore_path(assigns(:operatore))
  end

  test "should show operatore" do
    get :show, id: @operatore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operatore
    assert_response :success
  end

  test "should update operatore" do
    patch :update, id: @operatore, operatore: { cap: @operatore.cap, citta: @operatore.citta, civico: @operatore.civico, codfisc: @operatore.codfisc, cognome: @operatore.cognome, denominazione: @operatore.denominazione, email: @operatore.email, fax: @operatore.fax, indirizzo: @operatore.indirizzo, nome: @operatore.nome, note: @operatore.note, piva: @operatore.piva, provincia: @operatore.provincia, tel: @operatore.tel }
    assert_redirected_to operatore_path(assigns(:operatore))
  end

  test "should destroy operatore" do
    assert_difference('Operatore.count', -1) do
      delete :destroy, id: @operatore
    end

    assert_redirected_to operatores_path
  end
end
