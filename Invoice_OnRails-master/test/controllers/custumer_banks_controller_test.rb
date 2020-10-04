require 'test_helper'

class CustumerBanksControllerTest < ActionController::TestCase
  setup do
    @custumer_bank = custumer_banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custumer_banks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custumer_bank" do
    assert_difference('CustumerBank.count') do
      post :create, custumer_bank: { abi: @custumer_bank.abi, banca: @custumer_bank.banca, cab: @custumer_bank.cab, custumer_id: @custumer_bank.custumer_id, iban: @custumer_bank.iban, numero_conto: @custumer_bank.numero_conto }
    end

    assert_redirected_to custumer_bank_path(assigns(:custumer_bank))
  end

  test "should show custumer_bank" do
    get :show, id: @custumer_bank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custumer_bank
    assert_response :success
  end

  test "should update custumer_bank" do
    patch :update, id: @custumer_bank, custumer_bank: { abi: @custumer_bank.abi, banca: @custumer_bank.banca, cab: @custumer_bank.cab, custumer_id: @custumer_bank.custumer_id, iban: @custumer_bank.iban, numero_conto: @custumer_bank.numero_conto }
    assert_redirected_to custumer_bank_path(assigns(:custumer_bank))
  end

  test "should destroy custumer_bank" do
    assert_difference('CustumerBank.count', -1) do
      delete :destroy, id: @custumer_bank
    end

    assert_redirected_to custumer_banks_path
  end
end
