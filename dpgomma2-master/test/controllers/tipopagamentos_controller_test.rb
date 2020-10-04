require 'test_helper'

class TipopagamentosControllerTest < ActionController::TestCase
  setup do
    @tipopagamento = tipopagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipopagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipopagamento" do
    assert_difference('Tipopagamento.count') do
      post :create, tipopagamento: { titolo: @tipopagamento.titolo }
    end

    assert_redirected_to tipopagamento_path(assigns(:tipopagamento))
  end

  test "should show tipopagamento" do
    get :show, id: @tipopagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipopagamento
    assert_response :success
  end

  test "should update tipopagamento" do
    patch :update, id: @tipopagamento, tipopagamento: { titolo: @tipopagamento.titolo }
    assert_redirected_to tipopagamento_path(assigns(:tipopagamento))
  end

  test "should destroy tipopagamento" do
    assert_difference('Tipopagamento.count', -1) do
      delete :destroy, id: @tipopagamento
    end

    assert_redirected_to tipopagamentos_path
  end
end
