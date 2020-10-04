require 'test_helper'

class EntrataInvoicesControllerTest < ActionController::TestCase
  setup do
    @entrata_invoice = entrata_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrata_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrata_invoice" do
    assert_difference('EntrataInvoice.count') do
      post :create, entrata_invoice: { entrata_id: @entrata_invoice.entrata_id, invoice_id: @entrata_invoice.invoice_id }
    end

    assert_redirected_to entrata_invoice_path(assigns(:entrata_invoice))
  end

  test "should show entrata_invoice" do
    get :show, id: @entrata_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrata_invoice
    assert_response :success
  end

  test "should update entrata_invoice" do
    patch :update, id: @entrata_invoice, entrata_invoice: { entrata_id: @entrata_invoice.entrata_id, invoice_id: @entrata_invoice.invoice_id }
    assert_redirected_to entrata_invoice_path(assigns(:entrata_invoice))
  end

  test "should destroy entrata_invoice" do
    assert_difference('EntrataInvoice.count', -1) do
      delete :destroy, id: @entrata_invoice
    end

    assert_redirected_to entrata_invoices_path
  end
end
