require 'test_helper'

class PurchaseInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_invoice = purchase_invoices(:one)
  end

  test "should get index" do
    get purchase_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_invoice_url
    assert_response :success
  end

  test "should create purchase_invoice" do
    assert_difference('PurchaseInvoice.count') do
      post purchase_invoices_url, params: { purchase_invoice: { address_book_id: @purchase_invoice.address_book_id, attachment: @purchase_invoice.attachment, discount: @purchase_invoice.discount, invoice_date: @purchase_invoice.invoice_date, invoice_number: @purchase_invoice.invoice_number, note: @purchase_invoice.note, other: @purchase_invoice.other, paid: @purchase_invoice.paid, payment_method_id: @purchase_invoice.payment_method_id, tax_id: @purchase_invoice.tax_id, total_pretax: @purchase_invoice.total_pretax, total_price: @purchase_invoice.total_price, total_tax_price: @purchase_invoice.total_tax_price } }
    end

    assert_redirected_to purchase_invoice_url(PurchaseInvoice.last)
  end

  test "should show purchase_invoice" do
    get purchase_invoice_url(@purchase_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_invoice_url(@purchase_invoice)
    assert_response :success
  end

  test "should update purchase_invoice" do
    patch purchase_invoice_url(@purchase_invoice), params: { purchase_invoice: { address_book_id: @purchase_invoice.address_book_id, attachment: @purchase_invoice.attachment, discount: @purchase_invoice.discount, invoice_date: @purchase_invoice.invoice_date, invoice_number: @purchase_invoice.invoice_number, note: @purchase_invoice.note, other: @purchase_invoice.other, paid: @purchase_invoice.paid, payment_method_id: @purchase_invoice.payment_method_id, tax_id: @purchase_invoice.tax_id, total_pretax: @purchase_invoice.total_pretax, total_price: @purchase_invoice.total_price, total_tax_price: @purchase_invoice.total_tax_price } }
    assert_redirected_to purchase_invoice_url(@purchase_invoice)
  end

  test "should destroy purchase_invoice" do
    assert_difference('PurchaseInvoice.count', -1) do
      delete purchase_invoice_url(@purchase_invoice)
    end

    assert_redirected_to purchase_invoices_url
  end
end
