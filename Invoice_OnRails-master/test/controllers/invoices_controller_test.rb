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
      post :create, invoice: { costumer_id: @invoice.costumer_id, data: @invoice.data, imponibile: @invoice.imponibile, note: @invoice.note, numero: @invoice.numero, pagato: @invoice.pagato, payment_type_id: @invoice.payment_type_id, tax_id: @invoice.tax_id, totale: @invoice.totale, totale_iva: @invoice.totale_iva }
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
    patch :update, id: @invoice, invoice: { costumer_id: @invoice.costumer_id, data: @invoice.data, imponibile: @invoice.imponibile, note: @invoice.note, numero: @invoice.numero, pagato: @invoice.pagato, payment_type_id: @invoice.payment_type_id, tax_id: @invoice.tax_id, totale: @invoice.totale, totale_iva: @invoice.totale_iva }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
