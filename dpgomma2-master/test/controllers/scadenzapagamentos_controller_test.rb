require 'test_helper'

class ScadenzapagamentosControllerTest < ActionController::TestCase
  setup do
    @scadenzapagamento = scadenzapagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scadenzapagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scadenzapagamento" do
    assert_difference('Scadenzapagamento.count') do
      post :create, scadenzapagamento: { invoice_id: @scadenzapagamento.invoice_id, note: @scadenzapagamento.note, scadenza: @scadenzapagamento.scadenza }
    end

    assert_redirected_to scadenzapagamento_path(assigns(:scadenzapagamento))
  end

  test "should show scadenzapagamento" do
    get :show, id: @scadenzapagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scadenzapagamento
    assert_response :success
  end

  test "should update scadenzapagamento" do
    patch :update, id: @scadenzapagamento, scadenzapagamento: { invoice_id: @scadenzapagamento.invoice_id, note: @scadenzapagamento.note, scadenza: @scadenzapagamento.scadenza }
    assert_redirected_to scadenzapagamento_path(assigns(:scadenzapagamento))
  end

  test "should destroy scadenzapagamento" do
    assert_difference('Scadenzapagamento.count', -1) do
      delete :destroy, id: @scadenzapagamento
    end

    assert_redirected_to scadenzapagamentos_path
  end
end
