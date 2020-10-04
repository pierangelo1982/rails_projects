require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { azienda_id: @invoice.azienda_id, data: @invoice.data, entrata: @invoice.entrata, inviata: @invoice.inviata, netto: @invoice.netto, note: @invoice.note, numero: @invoice.numero, pagamento: @invoice.pagamento, pagato: @invoice.pagato, tax: @invoice.tax, totale: @invoice.totale }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { azienda_id: @invoice.azienda_id, data: @invoice.data, entrata: @invoice.entrata, inviata: @invoice.inviata, netto: @invoice.netto, note: @invoice.note, numero: @invoice.numero, pagamento: @invoice.pagamento, pagato: @invoice.pagato, tax: @invoice.tax, totale: @invoice.totale }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
