require 'test_helper'

class OperatorsControllerTest < ActionController::TestCase
  setup do
    @operator = operators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operator" do
    assert_difference('Operator.count') do
      post :create, operator: { cap: @operator.cap, citta: @operator.citta, civico: @operator.civico, codfisc: @operator.codfisc, cognome: @operator.cognome, denominazione: @operator.denominazione, email: @operator.email, fax: @operator.fax, indirizzo: @operator.indirizzo, nome: @operator.nome, note: @operator.note, piva: @operator.piva, provincia: @operator.provincia, tel: @operator.tel }
    end

    assert_redirected_to operator_path(assigns(:operator))
  end

  test "should show operator" do
    get :show, id: @operator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operator
    assert_response :success
  end

  test "should update operator" do
    patch :update, id: @operator, operator: { cap: @operator.cap, citta: @operator.citta, civico: @operator.civico, codfisc: @operator.codfisc, cognome: @operator.cognome, denominazione: @operator.denominazione, email: @operator.email, fax: @operator.fax, indirizzo: @operator.indirizzo, nome: @operator.nome, note: @operator.note, piva: @operator.piva, provincia: @operator.provincia, tel: @operator.tel }
    assert_redirected_to operator_path(assigns(:operator))
  end

  test "should destroy operator" do
    assert_difference('Operator.count', -1) do
      delete :destroy, id: @operator
    end

    assert_redirected_to operators_path
  end
end
