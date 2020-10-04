require 'test_helper'

class PurchasePaymentDeadlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_payment_deadline = purchase_payment_deadlines(:one)
  end

  test "should get index" do
    get purchase_payment_deadlines_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_payment_deadline_url
    assert_response :success
  end

  test "should create purchase_payment_deadline" do
    assert_difference('PurchasePaymentDeadline.count') do
      post purchase_payment_deadlines_url, params: { purchase_payment_deadline: { data: @purchase_payment_deadline.data, paid: @purchase_payment_deadline.paid, price: @purchase_payment_deadline.price, purchase_invoice_id: @purchase_payment_deadline.purchase_invoice_id } }
    end

    assert_redirected_to purchase_payment_deadline_url(PurchasePaymentDeadline.last)
  end

  test "should show purchase_payment_deadline" do
    get purchase_payment_deadline_url(@purchase_payment_deadline)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_payment_deadline_url(@purchase_payment_deadline)
    assert_response :success
  end

  test "should update purchase_payment_deadline" do
    patch purchase_payment_deadline_url(@purchase_payment_deadline), params: { purchase_payment_deadline: { data: @purchase_payment_deadline.data, paid: @purchase_payment_deadline.paid, price: @purchase_payment_deadline.price, purchase_invoice_id: @purchase_payment_deadline.purchase_invoice_id } }
    assert_redirected_to purchase_payment_deadline_url(@purchase_payment_deadline)
  end

  test "should destroy purchase_payment_deadline" do
    assert_difference('PurchasePaymentDeadline.count', -1) do
      delete purchase_payment_deadline_url(@purchase_payment_deadline)
    end

    assert_redirected_to purchase_payment_deadlines_url
  end
end
