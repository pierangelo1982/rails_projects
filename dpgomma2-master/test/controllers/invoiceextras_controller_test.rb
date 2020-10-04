require 'test_helper'

class InvoiceextrasControllerTest < ActionController::TestCase
  setup do
    @invoiceextra = invoiceextras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoiceextras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoiceextra" do
    assert_difference('Invoiceextra.count') do
      post :create, invoiceextra: { codice: @invoiceextra.codice, descrizione: @invoiceextra.descrizione, invoice_id: @invoiceextra.invoice_id, prezzo: @invoiceextra.prezzo, quantita: @invoiceextra.quantita }
    end

    assert_redirected_to invoiceextra_path(assigns(:invoiceextra))
  end

  test "should show invoiceextra" do
    get :show, id: @invoiceextra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoiceextra
    assert_response :success
  end

  test "should update invoiceextra" do
    patch :update, id: @invoiceextra, invoiceextra: { codice: @invoiceextra.codice, descrizione: @invoiceextra.descrizione, invoice_id: @invoiceextra.invoice_id, prezzo: @invoiceextra.prezzo, quantita: @invoiceextra.quantita }
    assert_redirected_to invoiceextra_path(assigns(:invoiceextra))
  end

  test "should destroy invoiceextra" do
    assert_difference('Invoiceextra.count', -1) do
      delete :destroy, id: @invoiceextra
    end

    assert_redirected_to invoiceextras_path
  end
end
